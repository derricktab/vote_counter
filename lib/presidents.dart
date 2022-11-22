import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Presidents extends StatefulWidget {
  const Presidents({super.key});

  @override
  State<Presidents> createState() => _PresidentsState();
}

class _PresidentsState extends State<Presidents> {
  var prefs;

  var nasser = 0;
  var osbert = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (nasser == 0) {
      setState(() {
        prefs.setInt('nasser', 0);
      });
    } else {
      setState(() {
        prefs.setInt('nasser', nasser);
      });
    }

    if (osbert == 0) {
      setState(() {
        prefs.setInt('osbert', 0);
      });
    } else {
      setState(() {
        prefs.setInt('osbert', osbert);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      osbert = int.parse(prefs.getInt("osbert").toString());
      nasser = int.parse(prefs.getInt("nasser").toString());
    });
  }

  _incrementNasser() {
    setState(() {
      nasser++;
      prefs.setInt('nasser', nasser);
    });
  }

  _incrementOsbert() {
    setState(() {
      osbert++;
      prefs.setInt('osbert', osbert);
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
              width: 200,
            ),
            const SizedBox(width: 30),
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
                    width: 300,
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
                    nasser.toString(),
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
                    width: 300,
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
                    osbert.toString(),
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
