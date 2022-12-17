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
<<<<<<< HEAD
  String? _nama;
  String? _email;
  String? _kendala;
=======
  String? nama;
  String? alamat;
  String? masalah;

>>>>>>> 58fff21aa06355b7bf0b8067b9d45dc93442ae2b
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.people),
                      hintText: "Contoh: Rafli Wasis Anggito",
                      labelText: "Nama",
                      // Menambahkan icon agar lebih intuitif
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        nama = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        nama = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "Contoh: rafli_wasis@gmail.com",
                      labelText: "Email",
                      // Menambahkan icon agar lebih intuitif
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        alamat = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        alamat = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.report_problem),
                      hintText: "Contoh: Uang tidak bertambah",
                      labelText: "Kendala",
                      // Menambahkan icon agar lebih intuitif
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        masalah = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        masalah = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Kendala tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  controller: dateInput,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: "Masukkan tanggal",
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyy').format(pickedDate);
                      setState(() {
                        dateInput.text = formattedDate;
                      });
                    } else {}
                  },
                ),
<<<<<<< HEAD
                Center(
                  child: YellowButton(
                    label: "Send",
                    onPressed: () {
                      if (_nama != null && _email != null && _kendala != null) {
                        final data = {
                          "nama": _nama,
                          "alamat": _email,
                          "masalah": _kendala,
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
                    },
                  ),
                ),
                const SizedBox(height: 24),
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
                            child: ContactCard(
                              alamat: snapshot.data![index].alamat,
                              masalah: snapshot.data![index].masalah
                            ),
                          );
                        }),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
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
=======
                YellowButton(
                  label: "Send",
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
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
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
>>>>>>> 58fff21aa06355b7bf0b8067b9d45dc93442ae2b
              ],
            ),
          ),
        ),
      ),
    );
  }
}
