import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Year1Representative extends StatefulWidget {
  const Year1Representative({super.key});

  @override
  State<Year1Representative> createState() => _Year1RepresentativeState();
}

class _Year1RepresentativeState extends State<Year1Representative> {
  var prefs;
  var cephas = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (cephas == 0) {
      prefs.setInt('cephas', 0);
    } else {
      prefs.setInt('cephas', cephas);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      cephas = int.parse(prefs.getInt("cephas").toString());
    });
  }

  incrementCephas() {
    setState(() {
      cephas++;
      prefs.setInt('cephas', cephas);
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
        title: const Text("COSAKU YEAR 1 REPRESENTATIVE CONTESTANTS"),
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
              "YEAR 1 REPRESENTATIVES",
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
              // CEPHAS
              Column(
                children: [
                  Image.asset(
                    "assets/cephas linkedin - Cephas Nzaana.jfif",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "CEPHAS T.O NZAANA ",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    cephas.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementCephas();
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
