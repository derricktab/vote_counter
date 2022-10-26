import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset("assets/logo.png")),

          // PRESIDENTS
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            title: const Text("Presidents"),
            onTap: () {
              Navigator.pushNamed(context, "president");
            },
          ),

          // VICE PRESIDENTS
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            title: const Text("Vice Presidents"),
            onTap: () {
              Navigator.pushNamed(context, "vice_presidents");
            },
          ),

          // SECRETARY
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            title: const Text("Secretary"),
            onTap: () {
              Navigator.pushNamed(context, "secretary");
            },
          ),

          // TREASURER
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            title: const Text("Treasurer"),
            onTap: () {
              Navigator.pushNamed(context, "treasurer");
            },
          ),

          // TECHNICAL LEAD
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            title: const Text("Technical Lead"),
            onTap: () {
              Navigator.pushNamed(context, "technical_lead");
            },
          ),

          // SPEAKER
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            title: const Text("Speaker"),
            onTap: () {
              Navigator.pushNamed(context, "speaker");
            },
          ),

          // PROJECTS LEAD
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            title: const Text("Projects Lead"),
            onTap: () {
              Navigator.pushNamed(context, "projects_lead");
            },
          ),

          // TEAM COORDINATOR
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            title: const Text("Team Coordinator"),
            onTap: () {
              Navigator.pushNamed(context, "team_coordinator");
            },
          ),

          // Events Planner & Research Lead
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            title: const Text("Events Planner & Research Lead"),
            onTap: () {
              Navigator.pushNamed(context, "events_planner");
            },
          ),

          // PUBILCITY
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            title: const Text("Publicity / Public Relations Officer"),
            onTap: () {
              Navigator.pushNamed(context, "publicity");
            },
          ),

          // Student Organization Representative Council Officer
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_sharp),
            title: const Text(
                "Student Organization Representative Council Officer"),
            onTap: () {
              Navigator.pushNamed(context, "student_organization");
            },
          ),
        ],
      ),
    );
  }
}
