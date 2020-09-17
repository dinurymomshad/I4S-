import 'package:flutter/material.dart';
import 'package:notification_alarm_example/components/edit_alarm_screen.dart';
import 'package:notification_alarm_example/configs/color_config.dart';

class AlarmHomeScreen extends StatefulWidget {
  @override
  _AlarmHomeScreenState createState() => _AlarmHomeScreenState();
}

class _AlarmHomeScreenState extends State<AlarmHomeScreen> {
  Colorss colors = Colorss();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Alarm",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.all(20),
                height: 400,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: EditAlarmCard())
          ],
        ),
      ),
    );
  }
}
