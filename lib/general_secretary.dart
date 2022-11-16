import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralSecretary extends StatefulWidget {
  const GeneralSecretary({super.key});

  @override
  State<GeneralSecretary> createState() => _GeneralSecretaryState();
}

class _GeneralSecretaryState extends State<GeneralSecretary> {
  var prefs;
  var brenda = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (brenda == null) {
      prefs.setInt('brenda', 0);
    } else {
      prefs.setInt('brenda', brenda);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      brenda = int.parse(prefs.getInt("brenda").toString());
    });
  }

  incrementBrenda() {
    setState(() {
      brenda++;
      prefs.setInt('brenda', brenda);
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
        title: const Text("COSAKU GENERAL SECRETARY CONTESTANTS"),
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
              "GENERAL SECRETARY",
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
                    "assets/wxde5l - Brenda Brenda Atuhaire.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ATUHAIRE BRENDA",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    brenda.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementBrenda();
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
