import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TeamCoordinator extends StatefulWidget {
  const TeamCoordinator({super.key});

  @override
  State<TeamCoordinator> createState() => _TeamCoordinatorState();
}

class _TeamCoordinatorState extends State<TeamCoordinator> {
  var prefs;
  var nasser;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();
    
    if (nasser == null) {
      prefs.setInt('nasser', 0);
    } else {
      prefs.setInt('nasser', nasser);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      nasser = prefs.getInt("nasser");
    });
  }

  incrementNasser() {
    setState(() {
      nasser++;
      prefs.setInt('nasser', nasser);
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
        title: const Text("TEAM COORDINATOR"),
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
              "TEAM COORDINATOR",
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
              // EVE
              Column(
                children: [
                  Image.asset(
                    "assets/NASSER.jpeg",
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
                    nasser.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementNasser();
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
