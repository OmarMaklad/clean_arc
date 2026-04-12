import 'dart:io';
import 'package:clean_arc/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:clean_arc/core/injection/injection_app.dart' as di;

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  await di.init();
  // await DioHelper.init();
  // await AppStorage.init();
   WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FlutterLocalNotificationHelper.init();
  // await FlutterLocalNotificationHelper.showNotification();
  // LocalNotification.listen();

  HttpOverrides.global = MyHttpOverrides();

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: [ Locale('ar'),Locale('en')],
      fallbackLocale: Locale('ar'),
      startLocale:Locale('en') ,
      path: 'assets/lang',
      assetLoader: CodegenLoader(),
      child: Placeholder(),
    ),
  );

  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    statusBarColor: Colors.black,));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

