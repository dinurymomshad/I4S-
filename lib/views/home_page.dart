import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:notification_alarm_example/models/home_model.dart';
import 'package:notification_alarm_example/views/alarm_home_screen.dart';
import 'package:notification_alarm_example/views/calculator.dart';
import 'package:notification_alarm_example/views/community_radio.dart';
import 'package:notification_alarm_example/views/cutdown_timer.dart';
import 'package:notification_alarm_example/views/stop_watch.dart';
import 'package:notification_alarm_example/views/torch.dart';
import 'package:notification_alarm_example/views/translator.dart';
import 'package:notification_alarm_example/views/weather.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _launch3URL() async {
    const url = 'https://www.tnc.edu.za/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launch8URL() async {
    const url = 'https://www.jozifm.co.za/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Image> imagess = [
    Image.asset("assets/slide1.JPG"),
    Image.asset("assets/slide2.JPG"),
    Image.asset("assets/slide3.JPG"),
    Image.asset("assets/slide4.JPG"),
    Image.asset("assets/slide5.JPG"),
    Image.asset("assets/slide6.JPG"),
    Image.asset("assets/slide7.JPG"),
    Image.asset("assets/slider7.jpeg"),
  ];

  final List<ChatListItem> chatListItem = [
    ChatListItem(
      title: "Alarm",
    ),
    ChatListItem(
      title: "Torch",
    ),
    ChatListItem(
      title: "CountDown",
    ),
    ChatListItem(
      title: "Learning Essential",
    ),
    ChatListItem(
      title: "Community Radio",
    )
  ];
  final CarouselController _controller = CarouselController();
  int _current = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          color: Color(0xff3C3C3C),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AlarmHomeScreen()));
                },
                leading: Icon(
                  Icons.alarm,
                  size: 25,
                  color: Colors.white,
                ),
                title: Text(
                  "Alarm",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Torch()));
                },
                leading: Icon(
                  Icons.lightbulb_outline,
                  size: 25,
                  color: Colors.white,
                ),
                title: Text(
                  "Torch",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StopWatch()));
                },
                leading: Icon(
                  Icons.watch_later,
                  size: 25,
                  color: Colors.white,
                ),
                title: Text(
                  "StopWatch",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CutDownTim()));
                },
                leading: Icon(
                  Icons.timer,
                  size: 25,
                  color: Colors.white,
                ),
                title: Text(
                  "Countdown",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calculator()));
                },
                leading: Icon(
                  Icons.device_hub,
                  size: 25,
                  color: Colors.white,
                ),
                title: Text(
                  "Calculator",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Translator()));
                },
                leading: Icon(
                  Icons.language,
                  size: 25,
                  color: Colors.white,
                ),
                title: Text(
                  "Translator",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Weather()));
                },
                leading: Icon(
                  Icons.surround_sound,
                  size: 25,
                  color: Colors.white,
                ),
                title: Text(
                  "Weather",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommunityRadio()));
                },
                leading: Icon(
                  Icons.radio,
                  size: 25,
                  color: Colors.white,
                ),
                title: Text(
                  "Community Radio",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.content_copy,
                  size: 25,
                  color: Colors.white,
                ),
                title: Text(
                  "Learning Essential",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff2C2C2C),
        title: Text(
          "I4S",
          style: TextStyle(fontFamily: 'avenie'),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                if (_current == 2) {
                  print(_current);
                  _launch3URL();
                } else if (_current == 7) {
                  print(_current);
                  _launch8URL();
                }
              },
              child: CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  height: 200,
                  aspectRatio: 16 / 12,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  carouselController: _controller,
                  scrollDirection: Axis.horizontal,
                ),
                items: imagess,
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Favourites",
                    style: TextStyle(fontSize: 18, fontFamily: 'avenie'),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: chatListItem.length,
                              separatorBuilder: (ctx, i) {
                                return Divider(
                                  indent: 20.0,
                                  endIndent: 20.0,
                                );
                              },
                              itemBuilder: (ctx, i) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      if (i == 0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AlarmHomeScreen()));
                                      } else if (i == 1) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Torch()));
                                      } else if (i == 2) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CutDownTim()));
                                      } else if (i == 3) {
                                        // Navigator.push(context, MaterialPageRoute(
                                        //   builder: (context) => AlramPage()
                                        // ));
                                      }
                                    },
                                    child: Card(
                                      elevation: 3.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          chatListItem[i].title,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
