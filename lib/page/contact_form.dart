import 'package:flutter/material.dart';
import 'package:flutter_nobokek/main.dart';
import 'package:flutter_nobokek/page/home_page.dart';
import 'package:flutter_nobokek/page/main_page.dart';
import 'package:flutter_nobokek/widgets/contact_card.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../commons/styles/color_palettes.dart';
import '../function/api.dart';
import '../widgets/target_card.dart';
import '../widgets/yellow_button.dart';

class MyContactPage extends StatefulWidget {
  const MyContactPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyContactPage> createState() => _MyContactPageState();
}

class _MyContactPageState extends State<MyContactPage> {
  final _formKey = GlobalKey<FormState>();
  String? nama;
  String? alamat;
  String? masalah;

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
        child: YellowButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text('Apa Kendalamu?'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              onChanged: (value) {
                                alamat = value;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                icon: Icon(Icons.email),
                              ),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                masalah = value;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Problem',
                                icon: Icon(Icons.report_problem),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      YellowButton(
                          label: "Submit",
                          onPressed: () {
                            if (alamat != null && masalah != null) {
                              final data = {
                                "alamat": alamat,
                                "masalah": masalah,
                              };
                              NoBokekApi.addProblem(context, data);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainPage(
                                      page: 5,
                                    ),
                                  ),
                                  (route) => false);
                            }
                          }),
                    ],
                  );
                });
          },
          label: "Tekan ini untuk mengirim masalah",
        ),
      ),
      Text(
        "Daftar Kendala",
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      FutureBuilder(
        future: NoBokekApi.fetchContact(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TargetCard(
                    title: snapshot.data![index].fields.alamat,
                    message: snapshot.data![index].fields.masalah,
                    onPressed: () {
                      NoBokekApi.deleteTarget(
                          context, snapshot.data![index].pk);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(
                              page: 5,
                            ),
                          ),
                          (route) => false);
                    },
                  ),
                );
              }),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorPalettes.freshLemon,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      ]
      ),
      ),
    );

  }
}
