import "package:flutter/material.dart";
import 'package:flutter_nobokek/page/add.dart';
import 'package:flutter_nobokek/page/report_page.dart';
import 'package:flutter_nobokek/page/forum.dart';
import 'package:flutter_nobokek/page/statistic.dart';

import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
   var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyAddPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Home'),
      ),

      body: Stack(
      children: <Widget>[
        Container(
          height: size.height * .45,
          decoration: BoxDecoration(
            color: Colors.green,
          )        
        ),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "NoBokek App",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: size.width * .55,
                child: Text(
                    "NoBokek ini dibuat untuk membantu mempermudah pengelolaan keuangan pengguna atau user khususnya bagi mahasiswa. Pengguna dapat mencatat pengeluaran serta pendapatan kemudian melihat perkembangannya perminggu dengan penyajian yang menarik dan mudah dimengerti. NoBokek juga menyediakan info terkini mengenai hal-hal yang terkait dengan dunia ekonomi dan finansial. Terdapat juga forum untuk pengguna melakukan posting."),
              ),
              SizedBox(height: 70),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .85,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    CategoryCard(
                      title: "Add",
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyAddPage();
                        }));
                      },
                      image: "https://media.discordapp.net/attachments/1037346407344001124/1051793605565628476/addflut-removebg-preview.png",
                    ),
                    CategoryCard(
                      title: "Statistic",
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyStatisticPage();
                        }));
                      },
                      image: "https://media.discordapp.net/attachments/1037346407344001124/1051794372569595905/statflut-removebg-preview.png",
                    ),
                    CategoryCard(
                      title: "Report User Info",
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyReportPage();
                        }));
                      },
                      image: "https://media.discordapp.net/attachments/1037346407344001124/1051794649905385532/reportflut-removebg-preview.png",
                    ),
                    CategoryCard(
                      title: "Forum",
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyForumPage();
                        }));
                      },
                      image: "https://media.discordapp.net/attachments/1037346407344001124/1051794884446650368/forum-removebg-preview.png",
                    ),
                    
                  ],
                ),
              ),
              InkWell(
              child: new Text('Open Browser'),
              onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
              ),
            ],
          ),
        ))
      ],
    ));
  }
}

class CategoryCard extends StatelessWidget {
  // final String svgSrc;
  final String title;
  final String image;
  final VoidCallback press;

  const CategoryCard({
    Key? key,
    // required this.svgSrc,
    required this.title,
    required this.press, 
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
          decoration: BoxDecoration(color: Colors.lightGreenAccent, boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
            )
          ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Image.network(image),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}