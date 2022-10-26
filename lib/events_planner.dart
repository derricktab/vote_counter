import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventsPlanner extends StatefulWidget {
  const EventsPlanner({super.key});

  @override
  State<EventsPlanner> createState() => _EventsPlannerState();
}

class _EventsPlannerState extends State<EventsPlanner> {
  var prefs;

  var kasozi;
  var dreck;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (kasozi == null) {
      prefs.setInt('kasozi', 0);
      print("THE VALUES IS NULL");
    } else {
      prefs.setInt('kasozi', kasozi);
    }

    if (dreck == null) {
      prefs.setInt('dreck', 0);
      print("ITS NULL");
    } else {
      prefs.setInt('dreck', dreck);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      kasozi = prefs.getInt("kasozi");
      dreck = prefs.getInt("dreck");
    });
  }

  incrementKasozi() {
    setState(() {
      kasozi++;
      prefs.setInt('kasozi', kasozi);
    });
  }

  incrementDreck() {
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
        title: const Text("EVENTS PLANNER & RESEARCH LEAD"),
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
              // KASOZI
              Column(
                children: [
                  Image.asset(
                    "assets/KASOZI.jpeg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "KASOZI DENIS",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    kasozi.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementKasozi();
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
                    "assets/DRECK.jpeg",
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
                      incrementDreck();
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
