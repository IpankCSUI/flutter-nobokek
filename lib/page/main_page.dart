import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';
import 'package:flutter_nobokek/page/add.dart';
import 'package:flutter_nobokek/page/forum.dart';
import 'package:flutter_nobokek/page/home_page.dart';
import 'package:flutter_nobokek/page/report_page.dart';
import 'package:flutter_nobokek/page/statistic.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageViewController = PageController();
  int _selectedPage = 0;

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageViewController,
          children: const <Widget>[
            MyAddPage(),
            MyStatisticPage(),
            MyHomePage(),
            MyReportPage(),
            MyForumPage(),
          ],
          onPageChanged: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorPalettes.white,
          currentIndex: _selectedPage,
          onTap: (index) {
            _pageViewController.animateToPage(
              index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear,
            );
          },
          showUnselectedLabels: true,
          selectedItemColor: ColorPalettes.green,
          selectedLabelStyle: const TextStyle(color: ColorPalettes.green),
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_to_photos), label: "Add"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: "Statistics"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money), label: "Report"),
            BottomNavigationBarItem(icon: Icon(Icons.forum), label: "Forum"),
          ],
        ),
      ),
    );
  }
}
