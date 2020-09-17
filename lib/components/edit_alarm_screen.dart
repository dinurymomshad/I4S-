import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_alarm_example/configs/color_config.dart';
import 'package:numberpicker/numberpicker.dart';

class EditAlarmCard extends StatefulWidget {
  @override
  _EditAlarmCardState createState() => _EditAlarmCardState();
}

class _EditAlarmCardState extends State<EditAlarmCard> {
  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Notification Icon:
  bool notificationEnabled = true;

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

  void editName() {
    showDialog(
        context: context,
        builder: (BuildContext contex) {
          return AlertDialog(
            title: Text("Edit Alarm Name"),
            content: TextField(
              onChanged: (val) {
                setState(() {
                  alarmName = val;
                });
              },
              decoration: InputDecoration(hintText: alarmName),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          );
        });
  }

  String alarmName = "New Alarm";
  void showTime() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pick Time"),
            content: Container(
              child: Column(children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text("HH"),
                        NumberPicker.integer(
                            initialValue: hour,
                            minValue: 0,
                            maxValue: 24,
                            onChanged: (val) {
                              setState(() {
                                hour = val;
                              });
                            })
                      ],
                    ),
                    Column(
                      children: [
                        Text("MM"),
                        NumberPicker.integer(
                            initialValue: min,
                            minValue: 0,
                            maxValue: 60,
                            onChanged: (val) {
                              setState(() {
                                min = val;
                              });
                            })
                      ],
                    )
                  ],
                )
              ]),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  print("Totoal Time is  ,,,,,,,,,,,,,, $timeForTimer");
                  print(min);
                  print(hour);
                },
                child: Text("Set"),
              )
            ],
          );
        });
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
                Text(
                  "Alarm Name",
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      notificationEnabled = !notificationEnabled;
                    });
                  },
                  icon: Icon(
                    Icons.notifications_active,
                    color: notificationEnabled ? colors.greenClr : Colors.grey,
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                editName();
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  alarmName,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                WeekDayToggle(
                  text: 'Mo',
                  /* current: time.monday,
                  onToggle: (monday) => time.monday = monday, */
                ),
                WeekDayToggle(
                  text: 'Tu',
                ),
                WeekDayToggle(
                  text: 'We',
                ),
                WeekDayToggle(
                  text: 'Th',
                ),
                WeekDayToggle(
                  text: 'Fr',
                ),
                WeekDayToggle(
                  text: 'Sa',
                ),
                WeekDayToggle(
                  text: 'Su',
                ),
              ],
            ),
            Divider(),
            InkWell(
                onTap: () async {
                  //showTime();
                  final showTime = await showTimePicker(
                      context: context,
                      initialTime:
                          TimeOfDay(hour: time.hour, minute: time.minute));
                  setState(() {
                    hour = showTime.hour ?? 0;
                    min = showTime.minute ?? 0;
                  });
                },
                child: Text(
                  "${time.hour}:${time.minute}",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () async {
                DateTime now = DateTime.now().toUtc().add(
                      Duration(seconds: timeForTimer),
                    );
                setState(() {
                  timeForTimer = ((hour * 60 * 60) + (min * 60));
                });
                await singleNotification(
                  now,
                  "$alarmName",
                  "Alarm is Ringing",
                  98123871,
                );
                print("Your timeto diss  $timeForTimer");
              },
              color: colors.greenClr,
              child: Text(
                "Save Alarm",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WeekDayToggle extends StatelessWidget {
  final Function onToggle;
  final bool current;
  final String text;

  const WeekDayToggle({Key key, this.onToggle, this.current = false, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 20.0;
    final textColor = this.current ? Colors.white : Colors.deepPurple;
    final blobColor = this.current ? Colors.deepPurple : Colors.white;

    return GestureDetector(
      child: SizedBox.fromSize(
        size: Size.fromRadius(size),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(size), color: blobColor),
          child: Center(
              child: Text(
            this.text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          )),
        ),
      ),
      onTap: () => null,
    );
  }
}
