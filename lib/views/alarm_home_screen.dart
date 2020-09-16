import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:notification_alarm_example/components/edit_alarm_screen.dart';
import 'package:notification_alarm_example/configs/color_config.dart';
class AlarmHomeScreen extends StatefulWidget {
  @override
  _AlarmHomeScreenState createState() => _AlarmHomeScreenState();
}

class _AlarmHomeScreenState extends State<AlarmHomeScreen> {


  FlutterLocalNotificationsPlugin localNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  initializeNotifications() async {
    var initializeAndroid = AndroidInitializationSettings('ic_launcher');
    var initializeIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializeAndroid, initializeIOS);
    await localNotificationsPlugin.initialize(initSettings);
  }

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  Future singleNotification(
      DateTime datetime, String message, String subtext, int hashcode,
      {String sound}) async {
    var androidChannel = AndroidNotificationDetails(
      'channel-id',
      'channel-name',
      'channel-description',
      sound: 'Alarm-Clock-Sound.mp3',
      importance: Importance.Max,
      priority: Priority.Max,
    );

    var iosChannel = IOSNotificationDetails();
    var platformChannel = NotificationDetails(androidChannel, iosChannel);
    localNotificationsPlugin.schedule(
        hashcode, message, subtext, datetime, platformChannel,
        payload: hashcode.toString());
  }

  Colorss colors = Colorss();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.greenClr,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Alarm",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            Container(
                padding: EdgeInsets.all(20),
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                width: MediaQuery.of(context).size.width,
                child: EditAlarmCard()
            )
          ],
        ),
      ),
    );
  }
}
