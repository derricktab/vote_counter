import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Presidents extends StatefulWidget {
  const Presidents({super.key});

  @override
  State<Presidents> createState() => _PresidentsState();
}

class _PresidentsState extends State<Presidents> {
  var prefs;

  var awany = 0;
  var deborah = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (deborah == 0) {
      setState(() {
        prefs.setInt('deborah', 0);
      });
    } else {
      setState(() {
        prefs.setInt('deborah', deborah);
      });
    }

    if (awany == 0) {
      setState(() {
        prefs.setInt('awany', 0);
      });
    } else {
      setState(() {
        prefs.setInt('awany', awany);
      });
    }

  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      deborah = int.parse(prefs.getInt("deborah").toString());
      awany = int.parse(prefs.getInt("awany").toString());
    });
  }

  _incrementDeborah() {
    setState(() {
      deborah++;
      prefs.setInt('deborah', deborah);
    });
  }

  _incrementAwany() {
    setState(() {
      awany++;
      prefs.setInt('awany', awany);
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
        title: const Text("COSAKU DEPUTY SPEAKER CANDIDATES"),
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
              "DEPUTY SPEAKER",
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
              // AWANY
              Column(
                children: [
                  Image.asset(
                    "assets/DSC_0091 - Mathew Alor.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "MATHEW ALOR AWANY",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    awany.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementAwany();
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

              // DEBORAH
              Column(
                children: [
                  Image.asset(
                    "assets/DGT_1721_025801 - nankunda deborah20.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "NANKUNDA DEBORAH",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    deborah.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementDeborah();
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
