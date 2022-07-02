import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wethifo/wether.dart';
import 'main.dart';

class weatherdata{
  Future<weather>getData(var latitude, var longitude )async{
    var uricall=Uri.parse('http://api.weatherapi.com/v1/current.json?key=aad6e78195c841219f291831222706&q=$latitude,$longitude&aqi=no');
    var response=await http.get(uricall);
    var body=jsonDecode(response.body);
    return weather.fromJson(body);
  }
}