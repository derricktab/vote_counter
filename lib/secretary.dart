import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Secretary extends StatefulWidget {
  const Secretary({super.key});

  @override
  State<Secretary> createState() => _SecretaryState();
}

class _SecretaryState extends State<Secretary> {
 var prefs;
  var shifra;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();
    
    if (shifra == null) {
      prefs.setInt('shifra', 0);
    } else {
      prefs.setInt('shifra', shifra);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      shifra = prefs.getInt("shifra");
    });
  }

  incrementShifra() {
    setState(() {
      shifra++;
      prefs.setInt('shifra', shifra);
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
        title: const Text("SECRETARY"),
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
              "SECRETARY",
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
                    "assets/SHIFRAH.jpeg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ABAHO SHIFRAH",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    shifra.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementShifra();
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
