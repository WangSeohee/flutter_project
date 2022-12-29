import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class Model {
  SvgPicture? getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        '/Users/seohee/Desktop/mobile_study/weather/weather/svg/climacon-cloud_lightning.svg',
        color: Colors.black87,
      );
    } else if (condition < 500) {
      return SvgPicture.asset(
        '/Users/seohee/Desktop/mobile_study/weather/weather/svg/climacon-cloud_rain.svg',
        color: Colors.black87,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        '/Users/seohee/Desktop/mobile_study/weather/weather/svg/climacon-cloud_snow_alt.svg',
        color: Colors.black87,
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        '/Users/seohee/Desktop/mobile_study/weather/weather/svg/climacon-sun.svg',
        color: Colors.black87,
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        '/Users/seohee/Desktop/mobile_study/weather/weather/svg/climacon-cloud_sun.svg',
        color: Colors.black87,
      );
    }
  }

  Widget? getBackground(int condition) {
    if (condition < 300) {
      return Image.asset(
        '/Users/seohee/Desktop/mobile_study/weather/weather/image/cloud_ligthing.JPEG',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      );
    } else if (condition < 500) {
      return Image.asset(
        '/Users/seohee/Desktop/mobile_study/weather/weather/image/cloud_rain.JPEG',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      );
    } else if (condition < 600) {
      return Image.asset(
        '/Users/seohee/Desktop/mobile_study/weather/weather/image/cloud_snow.JPEG',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      );
    } else if (condition == 800) {
      return Image.asset(
        '/Users/seohee/Desktop/mobile_study/weather/weather/image/sun.JPEG',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      );
    } else if (condition <= 804) {
      return Image.asset(
        '/Users/seohee/Desktop/mobile_study/weather/weather/image/cloud_sun.JPEG',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      );
    }
  }
}
