import 'package:flutter/material.dart';
import 'package:artifia_mc/controller/weather_provider.dart';

import '../../../constants/colors.dart';
import 'package:provider/provider.dart';

class CloudIcon extends StatelessWidget {
  const CloudIcon({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    switch (context.read<WeatherProvider>().curretShowingDetailsCat) {
      case "weatherCondition":
        return Icon(
          Icons.cloud,
          size: height / 12,
          color: whiteColor,
        );

      case "temperatureCelsius":
        return Icon(
          Icons.thermostat,
          size: height / 12,
          color: whiteColor,
        );
      case "humidity":
        return Icon(
          Icons.thermostat_rounded,
          size: height / 12,
          color: whiteColor,
        );

      case "feelsLikeCelsius":
        return Icon(
          Icons.thermostat_rounded,
          size: height / 12,
          color: whiteColor,
        );
      case "windSpeed":
        return Icon(
          Icons.cloud,
          size: height / 12,
          color: whiteColor,
        );
      default:
        return Icon(
          Icons.cloud,
          size: height / 12,
          color: whiteColor,
        );
    }
  }
}
