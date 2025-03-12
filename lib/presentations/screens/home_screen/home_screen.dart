import 'package:base_flutter_prj/presentations/blocs/home_bloc/home_action.dart';
import 'package:base_flutter_prj/presentations/blocs/home_bloc/home_bloc.dart';
import 'package:base_flutter_prj/presentations/blocs/home_bloc/home_state.dart';
import 'package:base_flutter_prj/widgets/base_page/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeBloc(), child: _HomeScreenPage());
  }
}

class _HomeScreenPage extends StatefulWidget {
  const _HomeScreenPage({super.key});

  @override
  State<_HomeScreenPage> createState() => __HomeScreenPageState();
}

class __HomeScreenPageState extends State<_HomeScreenPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<HomeBloc>().add(GetListMusic());
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "HomeScreen",
      showBackIcon: false,
      child: Container(
        alignment: Alignment.center,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.listMusic!.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.all(20.w),
                  color: Colors.blue,
                  child: Text(
                    state.listMusic![index].name!,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
