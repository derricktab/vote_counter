import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mobilizer extends StatefulWidget {
  const Mobilizer({super.key});

  @override
  State<Mobilizer> createState() => _MobilizerState();
}

class _MobilizerState extends State<Mobilizer> {
  var prefs;
  var bruno = 0;
  var ronald = 0;
  var nelson = 0;
  var nice = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    // ronald
    if (ronald == 0) {
      setState(() {
        prefs.setInt('ronald', 0);
      });
    } else {
      setState(() {
        prefs.setInt('ronald', ronald);
      });
    }

    // bruno
    if (bruno == 0) {
      setState(() {
        prefs.setInt('bruno', 0);
      });
    } else {
      setState(() {
        prefs.setInt('bruno', ronald);
      });
    }

    // nelson
    if (nelson == 0) {
      setState(() {
        prefs.setInt('nelson', 0);
      });
    } else {
      setState(() {
        prefs.setInt('nelson', nelson);
      });
    }

    // nice
    if (nice == 0) {
      setState(() {
        prefs.setInt('nice', 0);
      });
    } else {
      setState(() {
        prefs.setInt('nice', nice);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      ronald = int.parse(prefs.getInt("ronald").toString());
      bruno = int.parse(prefs.getInt("bruno").toString());
      nelson = int.parse(prefs.getInt("nelson").toString());
      nice = int.parse(prefs.getInt("nice").toString());
    });
  }

  incrementronald() {
    setState(() {
      ronald++;
      prefs.setInt('ronald', ronald);
    });
  }

  incrementbruno() {
    setState(() {
      bruno++;
      prefs.setInt('bruno', bruno);
    });
  }

  incrementnelson() {
    setState(() {
      nelson++;
      prefs.setInt('nelson', nelson);
    });
  }

  incrementnice() {
    setState(() {
      nice++;
      prefs.setInt('nice', nice);
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
        title: const Text("ISACA MOBILIZER CONTENSTANTS"),
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
              "MOBILIZER",
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

              // ATWIJUKYE RONALD
              Column(
                children: [
                  Image.asset(
                    "assets/IMG_20221016_131932_352 - Atwijukye Ronald.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ATWIJUKYE RONALD",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    ronald.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementronald();
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

              // OWAMANI BRUNO
              Column(
                children: [
                  Image.asset(
                    "assets/16687005444378214896405266011466 - AKANKUNDA GERRARD.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "OWAMANI BRUNO",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    bruno.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementbruno();
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

              // RUKUNDO NELSON
              Column(
                children: [
                  Image.asset(
                    "assets/IMG_20220722_174920_778 - Rukundo Nelson.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "RUKUNDO NELSON",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    nelson.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementnelson();
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

              // AYEBARE NICE
              Column(
                children: [
                  Image.asset(
                    "assets/IMG_20220226_170113_778 - Ayebare Nice.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "AYEBARE NICE",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    nice.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementnice();
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
