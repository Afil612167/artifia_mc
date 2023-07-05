import 'package:artifia_mc/controller/weather_provider.dart';
import 'package:artifia_mc/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  //  providers: [
  //   ChangeNotifierProvider(
  //     create: (context) => WeatherProvider(),
  //   ),
  // ],
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
