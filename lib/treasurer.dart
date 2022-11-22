import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Treasurer extends StatefulWidget {
  const Treasurer({super.key});

  @override
  State<Treasurer> createState() => _TreasurerState();
}

class _TreasurerState extends State<Treasurer> {
  var prefs;
  var dreck = 0;
  var mark = 0;
  var brenda = 0;
  var patricia = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    // mark
    if (mark == 0) {
      setState(() {
        prefs.setInt('mark', 0);
      });
    } else {
      setState(() {
        prefs.setInt('mark', mark);
      });
    }

    // dreck
    if (dreck == 0) {
      setState(() {
        prefs.setInt('dreck', 0);
      });
    } else {
      setState(() {
        prefs.setInt('dreck', mark);
      });
    }

    // brenda
    if (brenda == 0) {
      setState(() {
        prefs.setInt('brenda', 0);
      });
    } else {
      setState(() {
        prefs.setInt('brenda', brenda);
      });
    }

    // patricia
    if (patricia == 0) {
      setState(() {
        prefs.setInt('patricia', 0);
      });
    } else {
      setState(() {
        prefs.setInt('patricia', patricia);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      mark = int.parse(prefs.getInt("mark").toString());
      dreck = int.parse(prefs.getInt("dreck").toString());
      brenda = int.parse(prefs.getInt("brenda").toString());
      patricia = int.parse(prefs.getInt("patricia").toString());
    });
  }

  incrementMark() {
    setState(() {
      mark++;
      prefs.setInt('mark', mark);
    });
  }

  incrementDreck() {
    setState(() {
      dreck++;
      prefs.setInt('dreck', dreck);
    });
  }

  incrementBrenda() {
    setState(() {
      brenda++;
      prefs.setInt('brenda', brenda);
    });
  }

  incrementPatricia() {
    setState(() {
      patricia++;
      prefs.setInt('patricia', patricia);
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
        title: const Text("ISACA TREASURER CONTENSTANTS"),
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
              "TREASURER",
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
              // MARK
              Column(
                children: [
                  Image.asset(
                    "assets/mark - ASIIMWE MARK.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ASIIMWE MARK",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    mark.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementMark();
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

              const SizedBox(width: 20),

              // DRECK
              Column(
                children: [
                  Image.asset(
                    "assets/P-IMG-20221112-WA0078 - muhwezi dreck.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "MUHWEZI DRECK",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    dreck.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementDreck();
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

              const SizedBox(width: 20),

              // BRENDA
              Column(
                children: [
                  Image.asset(
                    "assets/5 - Brenda Brenda Atuhaire.jpg",
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

              const SizedBox(width: 20),

              // PATRICIA
              Column(
                children: [
                  Image.asset(
                    "assets/Snapchat-1804918806 - ATUHEIRE PATRICIA.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ATUHEIRE PATRICIA",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    patricia.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementPatricia();
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
