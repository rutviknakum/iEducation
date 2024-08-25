import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:user_apppp/constant.dart';
import 'package:user_apppp/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize(
    debug: true,
    ignoreSsl: true,
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(statusBarColor: primarycolor),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.light().copyWith(
        //   primaryColor: primarycolor,
        //   appBarTheme: AppBarTheme(
        //     color: primarycolor,
        //     elevation: 0,
        //   ),
        // ),
        home: SplashScreen(),
      ),
    );
  }
}
