
import 'package:flutter_nobokek/page/add.dart';
import 'package:flutter_nobokek/contact/contact_form.dart';
import 'package:flutter_nobokek/page/forum.dart';
import 'package:flutter_nobokek/page/home_page.dart';
import 'package:flutter_nobokek/page/report_page.dart';
import 'package:flutter_nobokek/page/statistic.dart';
import 'package:flutter/material.dart';

class LabDrawer extends StatefulWidget {
  const LabDrawer({super.key});

  @override
  State<LabDrawer> createState() => _LabDrawerState();
}

class _LabDrawerState extends State<LabDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Add"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MyAddPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Statistic"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MyStatisticPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Report User Info"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MyReportPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Forum"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MyForumPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Contact Us"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MyContactPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}