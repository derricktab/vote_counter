import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommitteeMembers extends StatefulWidget {
  const CommitteeMembers({super.key});

  @override
  State<CommitteeMembers> createState() => _CommitteeMembersState();
}

class _CommitteeMembersState extends State<CommitteeMembers> {
  var prefs;

  var aaron = 0;
  var babrah = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (babrah == 0) {
      setState(() {
        prefs.setInt('babrah', 0);
      });
    } else {
      setState(() {
        prefs.setInt('babrah', babrah);
      });
    }

    if (aaron == 0) {
      setState(() {
        prefs.setInt('aaron', 0);
      });
    } else {
      setState(() {
        prefs.setInt('aaron', aaron);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      aaron = int.parse(prefs.getInt("aaron").toString());
      babrah = int.parse(prefs.getInt("babrah").toString());
    });
  }

  _incrementBabrah() {
    setState(() {
      babrah++;
      prefs.setInt('babrah', babrah);
    });
  }

  _incrementAaron() {
    setState(() {
      aaron++;
      prefs.setInt('aaron', aaron);
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
        title: const Text("COSAKU COMMITTEE MEMBERS CANDIDATES"),
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
              "COMMITTEE MEMBERS",
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
              // AARON
              Column(
                children: [
                  Image.asset(
                    "assets/88967C1B-BD95-4AF6-8F8F-3C71751B5A5F - Wamono Aaron.jpeg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "WAMONO AARON",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    aaron.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementAaron();
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

              // BABRAH
              Column(
                children: [
                  Image.asset(
                    "assets/IMG-20220930-WA0042 - akankunda babrah.jpg",
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
                    babrah.toString(),
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
            ],
          ),
        )
      ]),
    );
  }
}
