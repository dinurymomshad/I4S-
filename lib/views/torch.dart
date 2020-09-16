import 'package:flutter/material.dart';
import 'package:torch_compat/torch_compat.dart';

class Torch extends StatefulWidget {
  @override
  _TorchState createState() => _TorchState();
}

class _TorchState extends State<Torch> {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  bool ison = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                "Tap on Bulb to Turn On",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'avenie',
                    fontWeight: FontWeight.w700),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (ison == false) {
                      setState(() {
                        ison = true;
                        TorchCompat.turnOn();
                      });
                    } else {
                      setState(() {
                        ison = false;
                        TorchCompat.turnOff();
                      });
                    }
                  });
                  print("Clicked");
                },
                child: ison == true
                    ? Image.asset(
                  "assets/on.png",
                  height: 500,
                  width: 500,
                )
                    : Image.asset(
                  "assets/off.png",
                  height: 500,
                  width: 500,
                ),
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    // Mandatory for Camera 1 on Android
    TorchCompat.dispose();
    super.dispose();
  }
}
