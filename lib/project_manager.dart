import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectManager extends StatefulWidget {
  const ProjectManager({super.key});

  @override
  State<ProjectManager> createState() => _ProjectManagerState();
}

class _ProjectManagerState extends State<ProjectManager> {
  var prefs;

  var blair = 0;
  var gerrard = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (blair == 0) {
      setState(() {
        prefs.setInt('blair', 0);
      });
    } else {
      setState(() {
        prefs.setInt('blair', blair);
      });
    }

    if (gerrard == 0) {
      setState(() {
        prefs.setInt('gerrard', 0);
      });
    } else {
      setState(() {
        prefs.setInt('gerrard', gerrard);
      });
    }

  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      gerrard = int.parse(prefs.getInt("gerrard").toString());
      blair = int.parse(prefs.getInt("blair").toString());
    });
  }

  _incrementGerrard() {
    setState(() {
      gerrard++;
      prefs.setInt('gerrard', gerrard);
    });
  }

  _incrementBlair() {
    setState(() {
      blair++;
      prefs.setInt('blair', blair);
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
        title: const Text("COSAKU PROJECT MANAGER CANDIDATES"),
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
              "PROJECT MANAGER",
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
              // BLAIR
              Column(
                children: [
                  Image.asset(
                    "assets/89 - Nkuba Blair.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "NKUBA BLAIR",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    blair.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementBlair();
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

              // GERRARD
              Column(
                children: [
                  Image.asset(
                    "assets/IMG_20220909_103136_131 - AKANKUNDA GERRARD.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "AKANKUNDA GERRARD",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    gerrard.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementGerrard();
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
