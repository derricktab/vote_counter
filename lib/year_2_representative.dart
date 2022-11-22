import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Year2Representative extends StatefulWidget {
  const Year2Representative({super.key});

  @override
  State<Year2Representative> createState() => _Year2RepresentativeState();
}

class _Year2RepresentativeState extends State<Year2Representative> {
  var prefs;

  var moreen = 0;
  var julius = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (moreen == 0) {
      setState(() {
        prefs.setInt('moreen', 0);
      });
    } else {
      setState(() {
        prefs.setInt('moreen', moreen);
      });
    }

    if (julius == 0) {
      setState(() {
        prefs.setInt('julius', 0);
      });
    } else {
      setState(() {
        prefs.setInt('julius', julius);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      moreen = int.parse(prefs.getInt("moreen").toString());
      julius = int.parse(prefs.getInt("julius").toString());
    });
  }

  _incrementMoreen() {
    setState(() {
      moreen++;
      prefs.setInt('moreen', moreen);
    });
  }

  _incrementJulius() {
    setState(() {
      julius++;
      prefs.setInt('julius', julius);
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
        title: const Text("COSAKU YEAR 2 REPRESENTATIVE CANDIDATES"),
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
              "YEAR 2 REPRESENTATIVE",
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
              // MOREEN
              Column(
                children: [
                  Image.asset(
                    "assets/Snapchat-269040843 - moureen asiimwe.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ASIIMWE MOREEN",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    moreen.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementMoreen();
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

              // JULIUS
              Column(
                children: [
                  Image.asset(
                    "assets/IMG_20220422_125907_342_transcpr - niwamanya julius.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "NIWAMANYA JULIUS",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    julius.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementJulius();
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
            ],
          ),
        )
      ]),
    );
  }
}
