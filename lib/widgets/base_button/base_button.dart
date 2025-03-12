import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    this.onPress,
    this.titleButton,
    this.height = 40,
    this.backgroundColor = Colors.orange,
    this.titleColor = Colors.white,
  });

  final Function? onPress;
  final String? titleButton;
  final double? height;
  final Color? backgroundColor;
  final Color? titleColor;

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
      borderRadius: BorderRadius.circular((height! / 2).w),
      color: backgroundColor,
      child: InkWell(
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular((height! / 2).w),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: height!.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular((height! / 2).w),
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
