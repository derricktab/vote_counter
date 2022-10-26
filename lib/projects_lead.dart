import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectsLead extends StatefulWidget {
  const ProjectsLead({super.key});

  @override
  State<ProjectsLead> createState() => _ProjectsLeadState();
}

class _ProjectsLeadState extends State<ProjectsLead> {
 var prefs;

  var onen;
  var phillip;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();
    
    if (onen == null) {
      prefs.setInt('onen', 0);
    } else {
      prefs.setInt('onen', onen);
    }

    
    if (phillip == null) {
      prefs.setInt('phillip', 0);
    } else {
      prefs.setInt('phillip', phillip);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      onen = prefs.getInt("onen");
      phillip = prefs.getInt("phillip");
    });
  }

  incrementOnen() {
    setState(() {
      onen++;
      prefs.setInt('onen', onen);
    });
  }

  incrementPhillip() {
    setState(() {
      phillip++;
      prefs.setInt('phillip', phillip);
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
        title: const Text("PROJECTS LEAD"),
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
              "PROJECTS LEAD",
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
                    "assets/ONEN.jpeg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ONEN THOMAS",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    onen.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementOnen();
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

              // PHILLIP
              Column(
                children: [
                  Image.asset(
                    "assets/PHILLIP.jpeg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "SSEMPEBWA PHILLIP",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    phillip.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),
                  GestureDetector(
                    onTap: (() {
                      incrementPhillip();
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
