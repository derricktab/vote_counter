import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentOrganization extends StatefulWidget {
  const StudentOrganization({super.key});

  @override
  State<StudentOrganization> createState() => _StudentOrganizationState();
}

class _StudentOrganizationState extends State<StudentOrganization> {
 var prefs;
  var alfred;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();
    
    if (alfred == null) {
      prefs.setInt('alfred', 0);
    } else {
      prefs.setInt('alfred', alfred);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      alfred = prefs.getInt("alfred");
    });
  }

  incrementAlfred() {
    setState(() {
      alfred++;
      prefs.setInt('alfred', alfred);
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
        title: const Text("Student Organization Representative Council Officer"),
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
              "Student Organization Representative Council Officer",
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
                    "assets/ALFRED.jpeg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "IRIMASO ALFRED",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    alfred.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementAlfred();
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
