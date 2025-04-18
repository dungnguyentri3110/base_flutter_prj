import 'package:base_flutter_prj/utils/translate.dart';
import 'package:base_flutter_prj/widgets/base_page/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  static final String routeName = '/account_screen';

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Account Screen",
      child: Center(
        child: Container(
          width: 100.w,
          child: Text(
            Translate.t.showDialog,
            style: TextStyle(fontSize: 30.sp),
          ),
        ),
      ),
    );
  }
}
