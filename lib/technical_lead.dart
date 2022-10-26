import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TechnicalLead extends StatefulWidget {
  const TechnicalLead({super.key});

  @override
  State<TechnicalLead> createState() => _TechnicalLeadState();
}

class _TechnicalLeadState extends State<TechnicalLead> {
  var prefs;

  var suvati;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();
    
    if (suvati == null) {
      prefs.setInt('suvati', 0);
    } else {
      prefs.setInt('suvati', suvati);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      suvati = prefs.getInt("suvati");
    });
  }

  incrementSuvati() {
    setState(() {
      suvati++;
      prefs.setInt('suvati', suvati);
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
        title: const Text("TECHNICAL LEAD"),
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
              "TECHNICAL LEAD",
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
                    "assets/SUVATI.jpeg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "KANADA SUVATI",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    suvati.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementSuvati();
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
