import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notification_alarm_example/configs/color_config.dart';
import 'package:notification_alarm_example/views/home_page.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Colorss colors = Colorss();

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colors.greenClr,
                      Colors.black
                    ]
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50)
                  )
                ),
                child: Text("I4S",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'avenir'),)),
            Text("Intelligent Student Study Support Suite",textAlign:TextAlign.center,style: TextStyle(color: colors.greenClr,fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'avenir'),),
          ],
        )
      ),
    );
  }
}
