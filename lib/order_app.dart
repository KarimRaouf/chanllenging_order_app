import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/app_colors.dart';

class OrderApp extends StatelessWidget {
  const OrderApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375 , 812),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        title: 'Order App',
        theme: ThemeData(
          primaryColor: AppColors.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.bottomNavScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
