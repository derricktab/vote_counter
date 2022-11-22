import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VicePresidents extends StatefulWidget {
  const VicePresidents({super.key});

  @override
  State<VicePresidents> createState() => _VicePresidentsState();
}

class _VicePresidentsState extends State<VicePresidents> {
  var prefs;
  var phillip = 0;

  initalizePrefs() async {
    prefs = await SharedPreferences.getInstance();

    if (phillip == 0) {
      setState(() {
        prefs.setInt('phillip', 0);
      });
    } else {
      setState(() {
        prefs.setInt('phillip', phillip);
      });
    }
  }

  getPrefValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      phillip = int.parse(prefs.getInt("phillip").toString());
    });
  }

  incrementPhillip() {
    setState(() {
      phillip++;
      prefs.setInt('phillip', phillip);
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
        title: const Text("ISACA VICE PRESIDENT CONTESTANTS"),
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
                    "assets/FB_IMG_16671660488515072 - Ssempeebwa Phillip.jpg",
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "SSEMPEBWA PHILLIP",
                    style: TextStyle(fontSize: 20),
                  ),

                  // COUNTER
                  Text(
                    phillip.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  // INCREMENTING BUTTON
                  GestureDetector(
                    onTap: (() {
                      incrementPhillip();
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
