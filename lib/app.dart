import 'package:cab_booking/splash_screen.dart';
import 'package:cab_booking/src/core/services/app_router.dart';
import 'package:cab_booking/src/core/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:responsive_framework/responsive_framework.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1100,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(320, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1100, name: DESKTOP),
          ],
          background: Container(
            color: AppColors.lightBackground,
          )),
      debugShowCheckedModeBanner: false,
      title: 'ICC MONTREAL',
      theme: lightTheme,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      navigatorKey: navigatorKey,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
      home: const SplashScreen(),
    );
  }
}
