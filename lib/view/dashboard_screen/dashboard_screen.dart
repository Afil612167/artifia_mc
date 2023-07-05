import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:artifia_mc/constants/colors.dart';
import 'package:artifia_mc/controller/weather_provider.dart';
import 'package:artifia_mc/view/dashboard_screen/widgets/custom_search_deligate.dart';
import 'package:artifia_mc/view/dashboard_screen/widgets/weather_icons.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().curretShowingDetailsCat = 'cloud';
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(height);
    return SafeArea(
      child: Consumer<WeatherProvider>(builder: (context, weatherProvider, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: builtSearchBar(context, width*.7)),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: mainBlack,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      weatherProvider.location.toString(),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: mainBlack,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  height: 400,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: mainBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 33)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CloudIcon(height: height),
                          Padding(padding: EdgeInsets.only(left: width / 20)),
                          Text(
                            weatherProvider.curretShowingDetailsCat!,
                            style: const TextStyle(
                                fontSize: 20, color: whiteColor),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 24)),
                      Text(
                        weatherProvider.currentShowingDetails.toString(),
                        style:
                            TextStyle(fontSize: 26, color: whiteColor),
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        weatherProvider.curretShowingDetailsCat!,
                        style:
                            TextStyle(fontSize: height / 32, color: whiteColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

Widget builtSearchBar(BuildContext context, double width) {
  return Container(
    width: width,
    height: 50,
    padding: const EdgeInsets.only(left: 15),
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 4,
              blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(8)),
    child: TextFormField(
      onTap: () async {
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
        );
      },
      readOnly: true,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}
