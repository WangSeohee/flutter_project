import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/model.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();
  late String cityName;
  late int temp;
  late Widget icon;
  late Widget background;
  late String des;
  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updataData(widget.parseWeatherData);
  }

  void updataData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    des = weatherData['weather'][0]['description'];
    temp = temp2.toInt();
    cityName = weatherData['name'];
    icon = model.getWeatherIcon(condition)!;
    background = model.getBackground(condition)!;
    print(temp);
    print(cityName);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.near_me),
            onPressed: () {},
            iconSize: 30.0,
            color: Colors.black),
        actions: [
          IconButton(
              icon: Icon(
                Icons.location_searching,
              ),
              onPressed: () {},
              iconSize: 30.0,
              color: Colors.black)
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            background,
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150.0,
                      ),
                      Text(
                        '$cityName',
                        style: GoogleFonts.lato(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          TimerBuilder.periodic(
                            (Duration(minutes: 1)),
                            builder: (context) {
                              print('${getSystemTime()}');
                              return Text(
                                '${getSystemTime()}',
                                style: GoogleFonts.lato(
                                    fontSize: 16.0, color: Colors.black),
                              );
                            },
                          ),
                          Text(DateFormat(' - EEEE').format(date),
                              style: GoogleFonts.lato(
                                  fontSize: 16.0, color: Colors.black)),
                        ],
                      ),
                      Text(DateFormat('d MMM, yyy').format(date),
                          style: GoogleFonts.lato(
                              fontSize: 16.0, color: Colors.black))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '$temp',
                            style: GoogleFonts.lato(
                                fontSize: 75.0,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                          Image.asset(
                              '/Users/seohee/Desktop/mobile_study/weather/weather/image/degree.png',
                              width: 70.0),
                        ],
                      ),
                      Row(
                        children: [
                          icon,
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '$des',
                            style: GoogleFonts.lato(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
