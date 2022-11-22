import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeputySpeaker extends StatefulWidget {
  const DeputySpeaker({super.key});

  @override
  State<DeputySpeaker> createState() => _DeputySpeakerState();
}

class _DeputySpeakerState extends State<DeputySpeaker> {
  var prefs;

  var kevin = 0;
  var bridget = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (bridget == 0) {
      setState(() {
        prefs.setInt('bridget', 0);
      });
    } else {
      setState(() {
        prefs.setInt('bridget', bridget);
      });
    }

    if (kevin == 0) {
      setState(() {
        prefs.setInt('kevin', 0);
      });
    } else {
      setState(() {
        prefs.setInt('kevin', kevin);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      bridget = int.parse(prefs.getInt("bridget").toString());
      kevin = int.parse(prefs.getInt("kevin").toString());
    });
  }

  _incrementKevin() {
    setState(() {
      kevin++;
      prefs.setInt('kevin', kevin);
    });
  }

  _incrementBridget() {
    setState(() {
      bridget++;
      prefs.setInt('bridget', bridget);
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
        title: const Text("ISACA VICE SPEAKER CANDIDATES"),
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
            const Text(
              "VICE SPEAKER",
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
              // KATUSHABE BRIDGET
              Column(
                children: [
                  Image.asset(
                    "assets/IMG_20220919_162937_666 - Katushabe Bridget.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "KATUSHABE BRIDGET",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    bridget.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementBridget();
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

              // ATWIJUKA KEVIN
              Column(
                children: [
                  Image.asset(
                    "assets/InShot_20221120_091537287 - atwijuka kevin.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ATWIJUKA KEVIN",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    kevin.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementKevin();
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
