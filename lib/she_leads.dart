import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SheLeads extends StatefulWidget {
  const SheLeads({super.key});

  @override
  State<SheLeads> createState() => _SheLeadsState();
}

class _SheLeadsState extends State<SheLeads> {
  var prefs;

  var glad = 0;
  var happy = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (happy == 0) {
      setState(() {
        prefs.setInt('happy', 0);
      });
    } else {
      setState(() {
        prefs.setInt('happy', happy);
      });
    }

    if (glad == 0) {
      setState(() {
        prefs.setInt('glad', 0);
      });
    } else {
      setState(() {
        prefs.setInt('glad', glad);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      happy = int.parse(prefs.getInt("happy").toString());
      glad = int.parse(prefs.getInt("glad").toString());
    });
  }

  _incrementglad() {
    setState(() {
      glad++;
      prefs.setInt('glad', glad);
    });
  }

  _incrementhappy() {
    setState(() {
      happy++;
      prefs.setInt('happy', happy);
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
        title: const Text("ISACA SHE LEADS COORDINATOR CANDIDATES"),
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
            const SizedBox(width: 15),
            const Text(
              "SHE LEADS COORDINATOR",
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
              // NUWASIIMA HAPPY
              Column(
                children: [
                  Image.asset(
                    "assets/IMG-20221119-WA0045 - NUWASIIMA Happy.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "NUWASIIMA HAPPY",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    happy.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementhappy();
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

              // OWOMUGISHA GLAD
              Column(
                children: [
                  Image.asset(
                    "assets/WhatsApp Image 2022-11-18 at 5.44.46 PM - Owomugisha Glad.jpeg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "OWOMUGISHA GLAD",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    glad.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementglad();
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
