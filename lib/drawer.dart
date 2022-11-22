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
            title: const Text("Vice President"),
            onTap: () {
              Navigator.pushNamed(context, "vice_president");
            },
          ),

          // SHE LEADS
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

          // VICE SPEAKER
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

        
        ],
      ),
    );
  }
}
