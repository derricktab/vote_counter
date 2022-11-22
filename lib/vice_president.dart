import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VicePresident extends StatefulWidget {
  const VicePresident({super.key});

  @override
  State<VicePresident> createState() => _VicePresidentState();
}

class _VicePresidentState extends State<VicePresident> {
  var prefs;
  var suvati = 0;
  var jesca = 0;
  var patrick = 0;
  var desire = 0;
  var eve = 0;
  var godfrey = 0;
  var ruth = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    // jesca
    if (jesca == 0) {
      setState(() {
        prefs.setInt('jesca', 0);
      });
    } else {
      setState(() {
        prefs.setInt('jesca', jesca);
      });
    }

    // suvati
    if (suvati == 0) {
      setState(() {
        prefs.setInt('suvati', 0);
      });
    } else {
      setState(() {
        prefs.setInt('suvati', jesca);
      });
    }

    // patrick
    if (patrick == 0) {
      setState(() {
        prefs.setInt('patrick', 0);
      });
    } else {
      setState(() {
        prefs.setInt('patrick', patrick);
      });
    }

    // desire
    if (desire == 0) {
      setState(() {
        prefs.setInt('desire', 0);
      });
    } else {
      setState(() {
        prefs.setInt('desire', desire);
      });
    }

    // eve
    if (eve == 0) {
      setState(() {
        prefs.setInt('eve', 0);
      });
    } else {
      setState(() {
        prefs.setInt('eve', eve);
      });
    }

    // godfrey
    if (godfrey == 0) {
      setState(() {
        prefs.setInt('godfrey', 0);
      });
    } else {
      setState(() {
        prefs.setInt('godfrey', godfrey);
      });
    }

    // ruth
    if (ruth == 0) {
      setState(() {
        prefs.setInt('ruth', 0);
      });
    } else {
      setState(() {
        prefs.setInt('ruth', ruth);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      jesca = int.parse(prefs.getInt("jesca").toString());
      suvati = int.parse(prefs.getInt("suvati").toString());
      patrick = int.parse(prefs.getInt("patrick").toString());
      desire = int.parse(prefs.getInt("desire").toString());
      eve = int.parse(prefs.getInt("eve").toString());
      godfrey = int.parse(prefs.getInt("godfrey").toString());
      ruth = int.parse(prefs.getInt("ruth").toString());
    });
  }

  incrementjesca() {
    setState(() {
      jesca++;
      prefs.setInt('jesca', jesca);
    });
  }

  incrementsuvati() {
    setState(() {
      suvati++;
      prefs.setInt('suvati', suvati);
    });
  }

  incrementpatrick() {
    setState(() {
      patrick++;
      prefs.setInt('patrick', patrick);
    });
  }

  incrementdesire() {
    setState(() {
      desire++;
      prefs.setInt('desire', desire);
    });
  }

  incrementeve() {
    setState(() {
      eve++;
      prefs.setInt('eve', eve);
    });
  }

  incrementgodfrey() {
    setState(() {
      godfrey++;
      prefs.setInt('godfrey', godfrey);
    });
  }

  incrementruth() {
    setState(() {
      ruth++;
      prefs.setInt('ruth', ruth);
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
        title: const Text("ISACA VICE PRESIDENT CONTENSTANTS"),
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
              "VICE PRESIDENT",
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
              // NABWAMI JESCA
              Column(
                children: [
                  Image.asset(
                    "assets/DGT_4607 - Jesca Nabwami.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "NABWAMI JESCA",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    jesca.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementjesca();
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

              // KANADA SUVATI
              Column(
                children: [
                  Image.asset(
                    "assets/DSC_7135 - Kanada Suvo.jpg",
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
                      incrementsuvati();
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

              // KAWEESI PATRICK
              Column(
                children: [
                  Image.asset(
                    "assets/DGT_9988 - Patrick Kaweesi.gif",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "KAWEESI PATRICK",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    patrick.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementpatrick();
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

              // SSENSALIRE DESIRE
              Column(
                children: [
                  Image.asset(
                    "assets/IMG-20221027-WA0085 - Desire Desire.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "SSENSALIRE DESIRE",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    desire.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementdesire();
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

              // NABUKENYA EVA
              Column(
                children: [
                  Image.asset(
                    "assets/IMG_20221002_123108_892 - nabukenya evelyn.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "NABUKENYA EVA",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    eve.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementeve();
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

              // AYEBARE B GODFREY
              Column(
                children: [
                  Image.asset(
                    "assets/vector.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "AYEBARE B GODFREY",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    godfrey.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementgodfrey();
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

              // ASIIMWE RUTH
              Column(
                children: [
                  Image.asset(
                    "assets/photo - Ruth Asiimwe.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "ASIIMWE RUTH",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    ruth.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementruth();
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
