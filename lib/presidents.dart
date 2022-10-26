import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Presidents extends StatefulWidget {
  const Presidents({super.key});

  @override
  State<Presidents> createState() => _PresidentsState();
}

class _PresidentsState extends State<Presidents> {
  var prefs;

  var babrahCounter;
  var patrickCounter;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();
    print(babrahCounter);

    if (babrahCounter == null) {
      prefs.setInt('babrah', 0);
    } else {
      prefs.setInt('babrah', babrahCounter);
    }

    if (patrickCounter == null) {
      prefs.setInt('patrick', 0);
    } else {
      prefs.setInt('patrick', patrickCounter);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      babrahCounter = prefs.getInt("babrah");
      patrickCounter = prefs.getInt("patrick");
    });
  }

  _incrementBabrah() {
    setState(() {
      babrahCounter++;
      prefs.setInt('babrah', babrahCounter);
    });
  }

  _incrementPatrick() {
    setState(() {
      patrickCounter++;
      prefs.setInt('patrick', patrickCounter);
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
        title: const Text("PRESIDENTS"),
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
              // BABRAH
              Column(
                children: [
                  Image.asset(
                    "assets/BABRAH.jpeg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "AKANKUNDA BABRAH",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    babrahCounter.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementBabrah();
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
                    "assets/PATRICK.jpeg",
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
                  Text(
                    patrickCounter.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),
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
