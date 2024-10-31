import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../core/constants/application_loading.dart';
import '../../../interface/bloc/application/application_cubit.dart';
import '../../../interface/service/crashlytics.dart';
import '../../../interface/service/wifi.dart';
import '../../../interface/usecase/notification.dart';
import '../../feature/widgets/dialog/app_dialog.dart';

part 'application_state.dart';
part 'application_action_helper.dart';

class ApplicationCubit extends Cubit<IApplicationState> implements IApplicationCubit{
  ApplicationCubit() : super(const ApplicationState()){
    Get.find<IWifiService>().onListener(onWifiStatus);
    Get.find<ICrashlyticsService>().onApplicationCrash();
    Get.find<INotificationUseCase>()..initialize()..onMessageOpenedApp(_onMessageOpenedApp);
  }

  final _ApplicationActionHelper helper = _ApplicationActionHelper();


  Future<void> _onMessageOpenedApp(RemoteMessage message) async {
    // Push another page onto the navigator when received a message
  }

  @override
  void setLoading([bool loading = true]) {
    if (loading) {
      emit(state.copyWith(loading: ApplicationLoading.loading));
    } else {
      emit(state.copyWith(loading: ApplicationLoading.completed));
    }
  }

  @override
  void onWifiStatus(ConnectivityResult result) {
    emit(state.copyWith(connectivityResult: result));
  }

  @override
  Future<T?> showBottomSheet<T>(BuildContext context, WidgetBuilder builder, {bool isDismissible = true}) {
    return helper.showBottomSheet(context, builder, isDismissible: isDismissible);
  }

  @override
  Future<bool> showConfirmDialog({String title = 'alert', String? des, IconData? icon, String? keyCancel, String? keyConfirm}) async {
    final bool? result = await helper.confirm(title: title, des: des, icon: icon, keyCancel: keyCancel, keyConfirm: keyConfirm);
    return result ?? false;
  }

  @override
  Future<void> showNotificationDialog({String title = 'notification', String? des, IconData? icon}) {
    return helper.notification(title: title, des:  des, icon: icon);
  }

  @override
  void showSnackBar(String message, {bool isError = false, bool isIcon = false}) {
    return helper.showSnackbar(message, isError: isError, isIcon: isIcon);
  }

  @override
  void unFocus() {
    return helper.unFocus();
  }

  @override
  void focus(BuildContext context, FocusNode node) {
    return helper.focus(context, node);
  }

}
