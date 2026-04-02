import 'package:base_flutter_prj/gen/assets.gen.dart';
import 'package:base_flutter_prj/themes/colors.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ToastType { success, error, warning }

class AppToast {
  static CancelFunc? _cancel;
  static bool showing = false;

  static showToast(String message, ToastType type) {
    hide();
    _cancel = BotToast.showCustomNotification(
      toastBuilder: (cancel) {
        Color _textColor;
        Color _bgColor;
        String _icon;
        if (type == ToastType.success) {
          _textColor = AppColors.toastSuccessText;
          _bgColor = AppColors.toastSuccessBG;
          _icon = Assets.icons.icToastSuccess;
        } else if (type == ToastType.error) {
          _textColor = AppColors.toastErrorText;
          _bgColor = AppColors.toastErrorBG;
          _icon = Assets.icons.icToastError;
        } else {
          _textColor = AppColors.toastErrorText;
          _bgColor = AppColors.toastErrorBG;
          _icon = Assets.icons.icToastError;
        }
        return Container(
          padding: EdgeInsets.all(16.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: _bgColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              SvgPicture.asset(_icon, width: 20.w, height: 20.w),
              SizedBox(width: 10, height: 10),
              Text(message, style: TextStyle(color: _textColor)),
            ],
          ),
        );
      },
      duration: Duration(seconds: 2),
    );
  }

  static hide() {
    _cancel?.call();
  }
}
