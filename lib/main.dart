import 'package:flutter/material.dart';
import 'package:vote_counter/committee_members.dart';
import 'package:vote_counter/deputy_speaker.dart';
import 'package:vote_counter/drawer.dart';
import 'package:vote_counter/general_secretary.dart';
import 'package:vote_counter/presidential_advisor.dart';
import 'package:vote_counter/presidents.dart';
import 'package:vote_counter/project_manager.dart';
import 'package:vote_counter/speaker.dart';
import 'package:vote_counter/treasurer.dart';
import 'package:vote_counter/vice_president.dart';
import 'package:vote_counter/year_1_representative.dart';
import 'package:vote_counter/year_2_representative.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISACA VOTE COUNTER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ISACA VOTE COUNTER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      routes: {
        "president": (context) => const Presidents(),
        "vice_presidents": (context) => const VicePresidents(),
        "speaker": (context) => const Speaker(),
        "deputy_speaker": (context) => const DeputySpeaker(),
        "general_secretary": (context) => const GeneralSecretary(),
        "treasurer": (context) => const Treasurer(),
        "presidential_advisor": (context) => const PresidentialAdvisor(),
        "committee_members": (context) => const CommitteeMembers(),
        "project_manager": (context) => const ProjectManager(),
        "year1_representative": (context) => const Year1Representative(),
        "year2_representative": (context) => const Year2Representative(),
      },
      home: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.webp", width: 550),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            const Center(
                child: Text(
              "WELCOME TO ISACA VOTE COUNTING PLATFORM",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "times",
                  color: Color.fromARGB(255, 6, 103, 149)),
            )),
          ],
        ),
      ),
    );
  }
}
