import 'package:flutter/material.dart';
import 'package:vote_counter/drawer.dart';
import 'package:vote_counter/events_planner.dart';
import 'package:vote_counter/presidents.dart';
import 'package:vote_counter/projects_lead.dart';
import 'package:vote_counter/publicity.dart';
import 'package:vote_counter/secretary.dart';
import 'package:vote_counter/speaker.dart';
import 'package:vote_counter/student_organization.dart';
import 'package:vote_counter/team_coordinator.dart';
import 'package:vote_counter/technical_lead.dart';
import 'package:vote_counter/treasurer.dart';
import 'package:vote_counter/vice_president.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COSAKU VOTING',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'COSAKU VOTING'),
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
        "secretary": (context) => const Secretary(),
        "technical_lead": (context) => const TechnicalLead(),
        "team_coordinator": (context) => const TeamCoordinator(),
        "publicity": (context) => const Publicity(),
        "speaker": (context) => const Speaker(),
        "treasurer": (context) => const Treasurer(),
        "student_organization": (context) => const StudentOrganization(),
        "events_planner": (context) => const EventsPlanner(),
        "projects_lead": (context) => const ProjectsLead(),
      },
      home: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const Center(child: Text("WELCOME TO COSAKU VOTE COUNTING PLATFORM")),
      ),
    );
  }
}
