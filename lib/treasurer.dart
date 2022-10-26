import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Treasurer extends StatefulWidget {
  const Treasurer({super.key});

  @override
  State<Treasurer> createState() => _TreasurerState();
}

class _TreasurerState extends State<Treasurer> {
 var prefs;
  var florence;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();
    
    if (florence == null) {
      prefs.setInt('florence', 0);
    } else {
      prefs.setInt('florence', florence);
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      florence = prefs.getInt("florence");
    });
  }

  incrementFlorence() {
    setState(() {
      florence++;
      prefs.setInt('florence', florence);
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
        title: const Text("TREASURER"),
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
              // EVE
              Column(
                children: [
                  Image.asset(
                    "assets/FLORENCE.jpeg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "BAGONZA FLORENCE",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    florence.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementFlorence();
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
