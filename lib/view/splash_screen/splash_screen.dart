import 'dart:async';

import 'package:artifia_mc/controller/weather_provider.dart';
import 'package:artifia_mc/servieces/fetch_weather.dart';
import 'package:artifia_mc/servieces/get_ip_from_api.dart';
import 'package:artifia_mc/view/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    fetchIpModel().then(
      (ipValue) {
        context.read<WeatherProvider>().ip = ipValue.ip!;
        context.read<WeatherProvider>().ipUpdate();
        // print(ipValue.ip);
        if (ipValue.ip!.isNotEmpty) {
          fetchWeatherModel(ipValue.ip).then((value) {
            if (value.current!.tempC != null) {
              //this fucnciton stores weather datas to shared preferences (local database)
              context
                  .read<WeatherProvider>()
                  .storeWeatherData(
                      value.current!.cloud.toString(),
                      value.location!.name,
                      value.current!.tempC.toString(),
                      value.current!.humidity.toString(),
                      value.current!.feelslikeC.toString(),
                      value.current!.gustKph.toString())
                  .then((value) {
                context.read<WeatherProvider>().getStoredData().then((value) {
                  print(context.read<WeatherProvider>().cloud.toString());
                  Timer(
                    //the execution take some time so i give only 2 second
                    Duration(seconds: 2),
                    () {
                      // context.read<WeatherProvider>().searchListAdding();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ),
                      );
                    },
                  );
                });
              });
            }
          });
        }
      },
    );
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'Artifitia Flutter Assignment',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
