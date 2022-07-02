import 'dart:math';

import 'package:flutter/material.dart';
class weather{
  var city;
  var icon;
  var condition;
  var tem;
  var wind;
  var humidity;
  var uv;
  var gust;
  var pressure;
  var lastupdate;
  var winddir;
  var picip;
  var date;
var feel;
  var maxtem;
  weather({
    required city,
    required icon,
    required condition,
    required wind,
    required uv,
    required humidity,
    required winddir,
    required picip,
    required lastupdate,
    required tem,
    required qust,
    required pressure,
    required feel,



  });
  weather.fromJson(Map<String,dynamic>json ){
    city=json['location']['name'];
    icon=json['current']['condition']['icon'];
    condition=json['current']['condition']['text'];
    tem=json['current']['temp_c'];
    wind=json['current']['wind_kph'];
    uv=json['current']['uv'];
    humidity=json['current']['humidity'];
    winddir=json['current']['wind_dir'];
    pressure=json['current']['pressure_mb'];
    picip=json['current']['precip_mm'];
    lastupdate=json['current']['last_updated'];
    gust=json['current']['gust_kph'];
    feel=json['current']['feelslike_c'];

  }
}