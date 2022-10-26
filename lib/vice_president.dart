import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class VicePresidents extends StatefulWidget {
  const VicePresidents({super.key});

  @override
  State<VicePresidents> createState() => _VicePresidentsState();
}

class _VicePresidentsState extends State<VicePresidents> {
  var prefs;
  var eveCounter;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();
    
    if (eveCounter == null) {
      prefs.setInt('eve', 0);
    } else {
      prefs.setInt('eve', eveCounter);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      eveCounter = prefs.getInt("eve");
    });
  }

  incrementEve() {
    setState(() {
      eveCounter++;
      prefs.setInt('eve', eveCounter);
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
        title: const Text("VICE PRESIDENTS"),
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
              "VICE PRESIDENTS",
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
                    "assets/EVE.jpeg",
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
                    eveCounter.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementEve();
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
