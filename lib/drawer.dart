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
          DrawerHeader(child: Image.asset("assets/logo.webp")),

          // PRESIDENTS
          ListTile(
            leading: const Icon(
              Icons.nest_cam_wired_stand_outlined,
              color: Colors.green,
            ),
            title: const Text("Presidents"),
            onTap: () {
              Navigator.pushNamed(context, "president");
            },
          ),

          // VICE PRESIDENTS
          ListTile(
            leading: const Icon(Icons.account_box_outlined),
            title: const Text("Vice Presidents"),
            onTap: () {
              Navigator.pushNamed(context, "vice_presidents");
            },
          ),

          // SPEAKER
          ListTile(
            leading: const Icon(
              Icons.woman_sharp,
              color: Colors.black,
            ),
            title: const Text("She Leads"),
            onTap: () {
              Navigator.pushNamed(context, "she_leads");
            },
          ),

          // DEPUTY SPEAKER
          ListTile(
            leading: const Icon(
              Icons.health_and_safety,
              color: Colors.pink,
            ),
            title: const Text("Vice Speaker"),
            onTap: () {
              Navigator.pushNamed(context, "deputy_speaker");
            },
          ),

          // VICE SECRETARY
          ListTile(
            leading: const Icon(
              Icons.note_alt_outlined,
              color: Colors.orange,
            ),
            title: const Text("Vice Secretary"),
            onTap: () {
              Navigator.pushNamed(context, "vice_secretary");
            },
          ),

          // TREASURER
          ListTile(
            leading: const Icon(
              Icons.money,
              color: Color.fromARGB(255, 208, 190, 27),
            ),
            title: const Text("Treasurer"),
            onTap: () {
              Navigator.pushNamed(context, "treasurer");
            },
          ),

          // MOBILIZER
          ListTile(
            leading: const Icon(
              Icons.addchart_rounded,
              color: Colors.blue,
            ),
            title: const Text("Mobilizer"),
            onTap: () {
              Navigator.pushNamed(context, "mobilizer");
            },
          ),

          // COMMITTEE MEMBERS
          ListTile(
            leading: const Icon(
              Icons.group,
              color: Colors.green,
            ),
            title: const Text("Committee Members"),
            onTap: () {
              Navigator.pushNamed(context, "committee_members");
            },
          ),

          // PROJECT MANAGER
          ListTile(
            leading: const Icon(
              Icons.system_security_update_good_sharp,
              color: Colors.purple,
            ),
            title: const Text("Project Manager"),
            onTap: () {
              Navigator.pushNamed(context, "project_manager");
            },
          ),

          // Year 1 representative
          ListTile(
            leading: const Icon(
              Icons.repeat_one_rounded,
              color: Colors.indigo,
            ),
            title: const Text("Year 1 Representative"),
            onTap: () {
              Navigator.pushNamed(context, "year1_representative");
            },
          ),

          // Year 2 representative
          ListTile(
            leading: const Icon(
              Icons.restore_page_outlined,
              color: Colors.brown,
            ),
            title: const Text("Year 2 Representative"),
            onTap: () {
              Navigator.pushNamed(context, "year2_representative");
            },
          ),
        ],
      ),
    );
  }
}
