import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:notification_alarm_example/configs/color_config.dart';
import 'package:numberpicker/numberpicker.dart';
class EditAlarmCard extends StatefulWidget {

  @override
  _EditAlarmCardState createState() => _EditAlarmCardState();
}

class _EditAlarmCardState extends State<EditAlarmCard> {
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
      importance: Importance.Max,
      priority: Priority.Max,
    );

    var iosChannel = IOSNotificationDetails();
    var platformChannel = NotificationDetails(androidChannel, iosChannel);
    localNotificationsPlugin.schedule(
        hashcode, message, subtext, datetime, platformChannel,
        payload: hashcode.toString());
  }
  DateTime time = DateTime.now();

  Colorss colors = Colorss();
  int hour = 0;
  int min = 0;
  int timeForTimer = 0;



  void editName(){
    showDialog(
        context: context,
        builder: (BuildContext contex){
          return AlertDialog(
            title: Text("Edit Alarm Name"),
            content: TextField(
              onChanged: (val){
                setState(() {
                  alarmNAme = val;
                });
              },
              decoration: InputDecoration(
                  hintText: alarmNAme
              ),
            ),
            actions: [
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("Save",style: TextStyle(color: Colors.white),),
              )
            ],
          );
        }
    );
  }

  String alarmNAme = "New Alarm";
  void showTime(){

    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Pick Time"),
          content: Container(
            child: Column(
              children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text("HH"),
                      NumberPicker.integer(
                          initialValue: hour,
                          minValue: 0,
                          maxValue: 24,
                          onChanged: (val){
                            setState(() {
                              hour = val;
                            });
                          }
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("MM"),
                      NumberPicker.integer(
                          initialValue: min,
                          minValue: 0,
                          maxValue: 60,
                          onChanged: (val){
                            setState(() {
                              min = val;
                            });
                          }
                      )
                    ],
                  )
                ],
              )
         ]
        ),
          ),
          actions: [
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
                print("Totoal Time is  ,,,,,,,,,,,,,, $timeForTimer");
                print(min);
                print(hour);
              },
              child: Text("Set"),
            )
          ],
        );
      }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name",style: TextStyle(fontSize: 18),),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.notifications_active,color: colors.greenClr,),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    editName();
                  },
                  child: Text(alarmNAme,style: TextStyle(fontSize: 24),),
                )
              ],
            ),
            SizedBox(height: 50,),
            InkWell(
                onTap: (){
                  showTime();
                },
                child: Text("${time.hour}:${time.minute}",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),)
            ),
            SizedBox(height: 50,),
            MaterialButton(
              onPressed: () async{
                DateTime now = DateTime.now().toUtc().add(
                  Duration(seconds: timeForTimer),
                );
                setState(() {
                  timeForTimer = ((hour * 60 * 60) + (min * 60));
                });
                await singleNotification(
                  now,
                  "$alarmNAme",
                  "Alarm is Ringing",
                  98123871,
                );
                print("Your timeto diss  $timeForTimer");
              },
              color: colors.greenClr,
              child: Text("Save Alarm",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
