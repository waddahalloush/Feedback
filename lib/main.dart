import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/Core/translations/codegen_loader.g.dart';
import 'package:medical/view/start_screen.dart';
import 'package:provider/provider.dart';

import 'Core/utils/Theme/app_theme.dart';
import 'viewModel/P List/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(MultiProvider(
      providers: providersList,
      builder: (context, child) => EasyLocalization(
          path: "assets/lang",
          supportedLocales: const [Locale('en'), Locale('ar')],
          fallbackLocale: const Locale('ar'),
          assetLoader: const CodegenLoader(),
          saveLocale: true,
          startLocale: const Locale('ar'),
          useOnlyLangCode: true,
          child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Feedback',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        home: const StartScreen(),
      ),
      designSize: const Size(1920, 1080),
    );
  }
}
