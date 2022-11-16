import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PresidentialAdvisor extends StatefulWidget {
  const PresidentialAdvisor({super.key});

  @override
  State<PresidentialAdvisor> createState() => _PresidentialAdvisorState();
}

class _PresidentialAdvisorState extends State<PresidentialAdvisor> {
  var prefs;

  var patrick = 0;
  var ojara = 0;
  var dreck = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (patrick == 0) {
      setState(() {
        prefs.setInt('patrick', 0);
      });
    } else {
      setState(() {
        prefs.setInt('patrick', patrick);
      });
    }

    if (ojara == 0) {
      setState(() {
        prefs.setInt('ojara', 0);
      });
    } else {
      setState(() {
        prefs.setInt('ojara', ojara);
      });
    }

    if (dreck == 0) {
      setState(() {
        prefs.setInt('dreck', 0);
      });
    } else {
      setState(() {
        prefs.setInt('dreck', dreck);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      ojara = int.parse(prefs.getInt("ojara").toString());
      patrick = int.parse(prefs.getInt("patrick").toString());
      dreck = int.parse(prefs.getInt("dreck").toString());
    });
  }

  _incrementOjara() {
    setState(() {
      ojara++;
      prefs.setInt('ojara', ojara);
    });
  }

  _incrementPatrick() {
    setState(() {
      patrick++;
      prefs.setInt('patrick', patrick);
    });
  }

  _incrementDreck() {
    setState(() {
      dreck++;
      prefs.setInt('dreck', dreck);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPrefValues();
    initalizePrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COSAKU PRESIDENTIAL ADVISOR CANDIDATES"),
        centerTitle: true,
      ),
      body: ListView(children: [
        const SizedBox(height: 80),

        // IMAGE AND NAME
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 100,
            ),
            const Text(
              "PRESIDENTIAL ADVISOR",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: "times new roman"),
            ),
          ],
        ),
        const SizedBox(height: 80),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // OJARA
              Column(
                children: [
                  Image.asset(
                    "assets/Picture1529108452503 - Ojara Walter.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "OJARA WALTER",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    ojara.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementOjara();
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text("ADD VOTE"),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 30),

              // PATRICK
              Column(
                children: [
                  Image.asset(
                    "assets/IMG_20221103_183320 - Wakooli viola.png",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "KAWEESI PATRICK",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    patrick.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementPatrick();
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text("ADD VOTE"),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 30),

              // DRECK
              Column(
                children: [
                  Image.asset(
                    "assets/IMG_20220123_184510 - muhwezi dreck.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "MUHWEZI DRECK",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    dreck.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),
                  GestureDetector(
                    onTap: (() {
                      _incrementDreck();
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text("ADD VOTE"),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
