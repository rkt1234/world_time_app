import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime
{
  String location=""; // location name for the UI
  String time=""; // the time in that location
  String flag=""; // url to asset flag icon
  String url=""; // location url for api endpoints
  bool isDaytime=true;
  WorldTime({this.location="",this.flag="",this.url=""});

  Future<void> getTime()
  async {

    try
    {
      var url1 = Uri.parse('https://www.worldtimeapi.org/api/timezone/$url');
      var response = await http.get(url1);
      Map data = jsonDecode(response.body);
      // print(data);
      // get properties from data
      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      //create DateTime object
      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offset) ));
      // isDaytime=now.hour > 6 && now.hour < 20 ? true : false;
      time=DateFormat.jm().format(now);
      // print("ye hai time ");
      // print(time);
      int l=time.length;
      String time1=time.substring(l-2);
      if(time1=="PM")
        isDaytime=false;
      else
        isDaytime=true;


    }

    catch(e)
    {
     print("Caught error : $e");
     time="could not get the data";
    }

  }

}

