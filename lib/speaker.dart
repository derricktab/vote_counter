import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Speaker extends StatefulWidget {
  const Speaker({super.key});

  @override
  State<Speaker> createState() => _SpeakerState();
}

class _SpeakerState extends State<Speaker> {
  var prefs;
  var paul = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (paul == null) {
      prefs.setInt('paul', 0);
    } else {
      prefs.setInt('paul', paul);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      paul = int.parse(prefs.getInt("paul").toString());
    });
  }

  incrementOjara() {
    setState(() {
      paul++;
      prefs.setInt('paul', paul);
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
        title: const Text("COSAKU SPEAKER CONTESTANTS"),
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
              "SPEAKER",
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
                    "assets/Screenshot_20221105-175823 - Paul Muhwezi.png",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "MUHWEZI PAUL",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    paul.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementOjara();
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
