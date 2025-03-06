import 'package:base_flutter_prj/presentations/screens/widgets/base_page/base_page.dart';
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
            "This is Account Screen",
            style: TextStyle(fontSize: 30.sp),
          ),
        ),
      ),
    );
  }
}
