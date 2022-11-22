import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Presidents extends StatefulWidget {
  const Presidents({super.key});

  @override
  State<Presidents> createState() => _PresidentsState();
}

class _PresidentsState extends State<Presidents> {
  var prefs;

  var julian = 0;
  var leticia = 0;
  var viola = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (julian == 0) {
      setState(() {
        prefs.setInt('julian', 0);
      });
    } else {
      setState(() {
        prefs.setInt('julian', julian);
      });
    }

    if (leticia == 0) {
      setState(() {
        prefs.setInt('leticia', 0);
      });
    } else {
      setState(() {
        prefs.setInt('leticia', leticia);
      });
    }

    if (viola == 0) {
      setState(() {
        prefs.setInt('viola', 0);
      });
    } else {
      setState(() {
        prefs.setInt('viola', viola);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      viola = int.parse(prefs.getInt("viola").toString());
      leticia = int.parse(prefs.getInt("leticia").toString());
      julian = int.parse(prefs.getInt("julian").toString());
    });
  }

  _incrementNasser() {
    setState(() {
      viola++;
      prefs.setInt('viola', viola);
    });
  }

  _incrementOsbert() {
    setState(() {
      leticia++;
      prefs.setInt('leticia', leticia);
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
        title: const Text("ISACA PRESIDENTIAL CANDIDATES"),
        centerTitle: true,
      ),
      body: ListView(children: [
        const SizedBox(height: 80),

        // IMAGE AND NAME
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.webp",
              width: 100,
            ),
            const Text(
              "PRESIDENTS",
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
              // LETICIA
              Column(
                children: [
                  Image.asset(
                    "assets/Screenshot_20221117-191111 - Byaruhanga Nasser.png",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "BYARUHANGA NASSER",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    leticia.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementNasser();
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

              // NDYAMUHAKYI OSBART
              Column(
                children: [
                  Image.asset(
                    "assets/IMG-20220724-WA0017 (2) - Twinomujuni Albert.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "NDYAMUHAKYI OSBART",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    viola.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementOsbert();
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

            ],
          ),
        )
      ]),
    );
  }
}
