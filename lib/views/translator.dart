import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Translator extends StatefulWidget {
  @override
  _TranslatorState createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  var translator = GoogleTranslator();
  String languageName1 = "English";
  String languageName2 = "Afrikaans";
  int index1;
  int index2;

  List<String> frstLanguages = [
    'English',
    'Afrikaans',
    'Sesotho ',
    'Xhosa',
    'Zulu',
  ];
  List<String> secLanguages = [
    'English',
    'Afrikaans',
    'Sesotho',
    'Xhosa',
    'Zulu',
  ];
  List<String> toLanguages = [
    'en',
    'af',
    'st'
        'xh',
    'zul',
  ];
  String input;
  var translated;

  void englishToAfricaans() {
    translator.translate(input, from: 'en', to: 'af').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void englishToSesotho() {
    translator.translate(input, from: 'en', to: 'st').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void englishToXhosa() {
    translator.translate(input, from: 'en', to: 'xh').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void englishToZulu() {
    translator.translate(input, from: 'en', to: 'zu').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void africanToEnglish() {
    translator.translate(input, from: 'af', to: 'en').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void africanToSesotho() {
    translator.translate(input, from: 'af', to: 'st').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void africanToXhosha() {
    translator.translate(input, from: 'af', to: 'xh').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void africanToZulu() {
    translator.translate(input, from: 'af', to: 'zu').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void sesothoToEnglish() {
    translator.translate(input, from: 'st', to: 'en').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void sesothoToAfrican() {
    translator.translate(input, from: 'st', to: 'af').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void sesothoToXhosha() {
    translator.translate(input, from: 'st', to: 'xh').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void sesothoToZulu() {
    translator.translate(input, from: 'st', to: 'zu').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void xhoshaToEnglish() {
    translator.translate(input, from: 'xh', to: 'en').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void xhoshaToAfrican() {
    translator.translate(input, from: 'xh', to: 'af').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void xhoshaToSesotho() {
    translator.translate(input, from: 'xh', to: 'st').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void xhoshaToZulu() {
    translator.translate(input, from: 'xh', to: 'zu').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void zuluToEnglish() {
    translator.translate(input, from: 'zu', to: 'en').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void zuluToAfrican() {
    translator.translate(input, from: 'zu', to: 'af').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void zuluToSesotho() {
    translator.translate(input, from: 'zu', to: 'st').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  void zuluToXhosha() {
    translator.translate(input, from: 'zu', to: 'xh').then((value) {
      setState(() {
        translated = value;
        print(translated);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff2C2C2C),
        title: Text("Translator"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5.0),
            child: Text("Translate From"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: DropdownButton<String>(
                    hint: new Text('Pickup on every'),
                    value: languageName1,
                    items: frstLanguages.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        languageName1 = value;
                        index1 = frstLanguages.indexOf(value);
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Translate To"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: DropdownButton<String>(
                    hint: new Text('Pickup on every'),
                    value: languageName2,
                    items: frstLanguages.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        languageName2 = value;
                        index2 = frstLanguages.indexOf(value);
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          // DropDownField(
          //     value: languageName1,
          //     required: true,
          //     strict: true,
          //     labelText: 'Translate From',
          //     icon: Icon(Icons.language),
          //     items: frstLanguages,
          //     setter: (dynamic newValue) {
          //       setState(() {
          //         languageName1 = newValue;
          //         index1 = frstLanguages.indexOf(newValue);
          //         print(index1);
          //       });
          //     }),
          // DropDownField(
          //     value: languageName2,
          //     required: true,
          //     strict: true,
          //     labelText: 'Translate To',
          //     icon: Icon(Icons.language),
          //     items: frstLanguages,
          //     setter: (dynamic newValue) {
          //       setState(() {
          //         languageName2 = newValue;
          //         index1 = frstLanguages.indexOf(newValue);
          //         print(index1);
          //       });
          //     }),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Write Something"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  input = val;
                  if (index1 == 0 && index2 == 1) {
                    // english  african
                    englishToAfricaans();
                  } else if (index1 == 0 && index2 == 2) {
                    //sesotho
                    englishToSesotho();
                  } else if (index1 == 0 && index2 == 3) {
                    //xhosha
                    englishToXhosa();
                  } else if (index1 == 0 && index2 == 4) {
                    //zulu
                    englishToZulu();
                  } else if (index1 == 1 && index2 == 0) {
                    //african english
                    africanToEnglish();
                  } else if (index1 == 1 && index2 == 2) {
                    //sesotho
                    africanToSesotho();
                  } else if (index1 == 1 && index2 == 3) {
                    //xhosha
                    africanToXhosha();
                  } else if (index1 == 1 && index2 == 4) {
                    //zulu
                    africanToZulu();
                  } else if (index1 == 2 && index2 == 0) {
                    //sesotho  english
                    sesothoToEnglish();
                  } else if (index1 == 2 && index2 == 1) {
                    //african
                    sesothoToAfrican();
                  } else if (index1 == 2 && index2 == 2) {
                    //xhosha
                    sesothoToXhosha();
                  } else if (index1 == 2 && index2 == 4) {
                    //zulu
                    sesothoToZulu();
                  } else if (index1 == 3 && index2 == 4) {
                    //xhosha english
                    xhoshaToEnglish();
                  } else if (index1 == 3 && index2 == 2) {
                    //african
                    xhoshaToAfrican();
                  } else if (index1 == 3 && index2 == 3) {
                    //sesotho
                    xhoshaToSesotho();
                  } else if (index1 == 3 && index2 == 4) {
                    //zulu
                    xhoshaToZulu();
                  } else if (index1 == 4 && index2 == 2) {
                    //zulu  english
                    zuluToEnglish();
                  } else if (index1 == 4 && index2 == 3) {
                    //african
                    zuluToAfrican();
                  } else if (index1 == 4 && index2 == 4) {
                    //sesotho
                    zuluToSesotho();
                  } else if (index1 == 4 && index2 == 2) {
                    //xhosha
                    zuluToXhosha();
                  }
                });
              },
              maxLines: 5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintMaxLines: 5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                  color: Color(0xff2C2C2C),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "$translated",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: MaterialButton(
              onPressed: () {
                if (index1 == 0 && index2 == 1) {
                  // english  african
                  englishToAfricaans();
                } else if (index1 == 0 && index2 == 2) {
                  //sesotho
                  englishToSesotho();
                } else if (index1 == 0 && index2 == 3) {
                  //xhosha
                  englishToXhosa();
                } else if (index1 == 0 && index2 == 4) {
                  //zulu
                  englishToZulu();
                } else if (index1 == 1 && index2 == 0) {
                  //african english
                  africanToEnglish();
                } else if (index1 == 1 && index2 == 2) {
                  //sesotho
                  africanToSesotho();
                } else if (index1 == 1 && index2 == 3) {
                  //xhosha
                  africanToXhosha();
                } else if (index1 == 1 && index2 == 4) {
                  //zulu
                  africanToZulu();
                } else if (index1 == 2 && index2 == 0) {
                  //sesotho  english
                  sesothoToEnglish();
                } else if (index1 == 2 && index2 == 1) {
                  //african
                  sesothoToAfrican();
                } else if (index1 == 2 && index2 == 2) {
                  //xhosha
                  sesothoToXhosha();
                } else if (index1 == 2 && index2 == 4) {
                  //zulu
                  sesothoToZulu();
                } else if (index1 == 3 && index2 == 4) {
                  //xhosha english
                  xhoshaToEnglish();
                } else if (index1 == 3 && index2 == 2) {
                  //african
                  xhoshaToAfrican();
                } else if (index1 == 3 && index2 == 3) {
                  //sesotho
                  xhoshaToSesotho();
                } else if (index1 == 3 && index2 == 4) {
                  //zulu
                  xhoshaToZulu();
                } else if (index1 == 4 && index2 == 2) {
                  //zulu  english
                  zuluToEnglish();
                } else if (index1 == 4 && index2 == 3) {
                  //african
                  zuluToAfrican();
                } else if (index1 == 4 && index2 == 4) {
                  //sesotho
                  zuluToSesotho();
                } else if (index1 == 4 && index2 == 2) {
                  //xhosha
                  zuluToXhosha();
                }
              },
              color: Colors.green,
              child: Text("Translate"),
            ),
          )
        ],
      ),
    );
  }
}
