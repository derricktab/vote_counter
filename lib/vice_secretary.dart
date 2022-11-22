import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViceSecretary extends StatefulWidget {
  const ViceSecretary({super.key});

  @override
  State<ViceSecretary> createState() => _ViceSecretaryState();
}

class _ViceSecretaryState extends State<ViceSecretary> {
  var prefs;

  var gerrald = 0;
  var armson = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (armson == 0) {
      setState(() {
        prefs.setInt('armson', 0);
      });
    } else {
      setState(() {
        prefs.setInt('armson', armson);
      });
    }

    if (gerrald == 0) {
      setState(() {
        prefs.setInt('gerrald', 0);
      });
    } else {
      setState(() {
        prefs.setInt('gerrald', gerrald);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      armson = int.parse(prefs.getInt("armson").toString());
      gerrald = int.parse(prefs.getInt("gerrald").toString());
    });
  }

  _incrementgerrald() {
    setState(() {
      gerrald++;
      prefs.setInt('gerrald', gerrald);
    });
  }

  _incrementarmson() {
    setState(() {
      armson++;
      prefs.setInt('armson', armson);
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
        title: const Text("ISACA VICE SECRETARY CANDIDATES"),
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
            const Text(
              "VICE SECRETARY",
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
              // TUMWEKWATSE ARMSON
              Column(
                children: [
                  Image.asset(
                    "assets/IMG_20221118_122325_224 - Armson Tumwekwatse.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "TUMWEKWATSE ARMSON",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    armson.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementarmson();
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

              // MANIRIHO GERALD
              Column(
                children: [
                  Image.asset(
                    "assets/DSC_8098 - hammza gero.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "MANIRIHO GERALD",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    gerrald.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      _incrementgerrald();
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
