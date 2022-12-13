import "package:flutter/material.dart";
import 'package:flutter_nobokek/page/contact_form.dart';
import 'package:flutter_nobokek/page/add.dart';
import 'package:flutter_nobokek/page/report_page.dart';
import 'package:flutter_nobokek/page/forum.dart';
import 'package:flutter_nobokek/page/statistic.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../commons/styles/color_palettes.dart';
import 'login_page.dart';

class MyHomePage extends StatefulWidget {
  final int page;
  const MyHomePage({
    super.key,
    this.page = 2,
  });
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController? _pageViewController;
  int? _selectedPage;

  @override
  void initState() {
    super.initState();
    _selectedPage = widget.page;
    _pageViewController = PageController(initialPage: widget.page);
  }

  @override
  void dispose() {
    _pageViewController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyAddPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Home'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     signOut();
      //   },
      //   child: Icon(Icons.logout_rounded),
      //   backgroundColor: Colors.green,
      // ),
      
      body: Stack(
        children: <Widget>[
          Container(
              height: size.height * .45,
              decoration: BoxDecoration(
                color: Colors.green,
              )),
        //       PageView(
        //   controller: _pageViewController,
        //   children: const <Widget>[
        //     MyAddPage(),
        //     MyStatisticPage(),
        //     MyHomePage(),
        //     MyReportPage(),
        //     MyForumPage(),
        //     MyContactPage(),
        //   ],
        //   onPageChanged: (index) {
        //     setState(() {
        //       _selectedPage = index;
        //     });
        //   },
        // ),
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
                        image:
                            "https://media.discordapp.net/attachments/1037346407344001124/1051793605565628476/addflut-removebg-preview.png",
                      ),
                      CategoryCard(
                        title: "Statistic",
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyStatisticPage();
                          }));
                        },
                        image:
                            "https://media.discordapp.net/attachments/1037346407344001124/1051794372569595905/statflut-removebg-preview.png",
                      ),
                      CategoryCard(
                        title: "Report User Info",
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyReportPage();
                          }));
                        },
                        image:
                            "https://media.discordapp.net/attachments/1037346407344001124/1051794649905385532/reportflut-removebg-preview.png",
                      ),
                      CategoryCard(
                        title: "Forum",
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyForumPage();
                          }));
                        },
                        image:
                            "https://media.discordapp.net/attachments/1037346407344001124/1051794884446650368/forum-removebg-preview.png",
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.newspaper),
                        title: Text('Inovasi Keuangan Digital Terus Berlanjut'),
                        subtitle: Text(
                            'Mengutip data Aftech 2022, kini ada 20 jenis layanan keuangan digital... '),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                              child: const Text('DETAILS'),
                              onPressed: () => launch(
                                  'https://www.kompas.id/baca/ekonomi/2022/12/12/inovasi-keuangan-digital-terus-berlanjut')),
                          const SizedBox(width: 8),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: ColorPalettes.white,
      //   currentIndex: _selectedPage!,
      //   onTap: (index) {
      //     _pageViewController!.animateToPage(
      //       index,
      //       duration: const Duration(milliseconds: 200),
      //       curve: Curves.linear,
      //     );
      //   },
      //   showUnselectedLabels: true,
      //   selectedItemColor: ColorPalettes.green,
      //   selectedLabelStyle: const TextStyle(color: ColorPalettes.green),
      //   unselectedItemColor: Colors.black,
      //   unselectedLabelStyle: const TextStyle(color: Colors.black),
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.add_to_photos), label: "Add"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.bar_chart), label: "Statistics"),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.attach_money), label: "Report"),
      //     BottomNavigationBarItem(icon: Icon(Icons.forum), label: "Forum"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.contact_phone), label: "Contact Us"),
      //   ],
      // ),
    );
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
