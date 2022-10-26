import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Publicity extends StatefulWidget {
  const Publicity({super.key});

  @override
  State<Publicity> createState() => _PublicityState();
}

class _PublicityState extends State<Publicity> {
  var prefs;
  var kevin;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (kevin == null) {
      prefs.setInt('kevin', 0);
      print("THE VALUE IS NULL");
    } else {
      prefs.setInt('kevin', kevin);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      kevin = prefs.getInt("kevin");
    });
  }

  incrementKevin() {
    setState(() {
      kevin++;
      prefs.setInt('kevin', kevin);
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
        title: const Text("Publicity / Public Relations officer"),
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
              "Publicity / Public Relations officer",
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
                    "assets/KEVIN.jpeg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ATWIJUKA KEVIN",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    kevin.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementKevin();
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
