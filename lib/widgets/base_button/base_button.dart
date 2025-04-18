import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    this.onPress,
    this.titleButton,
    this.height,
    this.backgroundColor = Colors.orange,
    this.titleColor = Colors.white,
    this.borderRadius,
    this.width,
  });

  final Function? onPress;
  final String? titleButton;
  final double? height;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? borderRadius;
  final double? width;

  factory BaseButton.outline({
    Function? onPress,
    String? titleButton,
    double? height = 40,
    Color? titleColor = Colors.orange,
  }) {
    return BaseButton(
      onPress: onPress,
      titleButton: titleButton,
      height: height,
      backgroundColor: Colors.white,
      titleColor: titleColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
      ),
      color: backgroundColor,
      child: InkWell(
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
        child: Container(
          width: width ?? double.infinity,
          alignment: Alignment.center,
          height: height ?? 49.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
            border: Border.all(width: 1, color: Colors.orange),
          ),
          child: Text(
            titleButton ?? '',
            style: TextStyle(color: titleColor, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          onPress?.call();
        },
      ),
    );
  }
}
