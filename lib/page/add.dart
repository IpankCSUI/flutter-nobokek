
import 'package:flutter_nobokek/models/money.dart';
import 'package:flutter_nobokek/function/fetch_money.dart';
import 'package:flutter_nobokek/function/api.dart';
import 'package:flutter_nobokek/widgets/yellow_button.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import '../commons/styles/color_palettes.dart';

class MyAddPage extends StatefulWidget {
  const MyAddPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyAddPage> createState() => _MyAddPageState();
}

class Money {
  late double income;
  late double outcome;
  late dynamic descIn;
  late dynamic descOut;
  late DateTime date;
  late dynamic note;

  Money(
      {
        required this.income, 
        required this.outcome, 
        required this.descIn, 
        required this.descOut,
        required this.date,
        });
}

class _MyAddPageState extends State<MyAddPage> {
//   class Budget {
//   late String judul;
//   late int nominal;
//   late String jenisBudget;
//   late DateTime tanggal;

//   Budget(
//       {
//         required this.judul, 
//         required this.nominal, 
//         required this.jenisBudget, 
//         required this.tanggal,
//         });
// }
  
  final _formKey = GlobalKey<FormState>();
  double? income;
  double? outcome;
  String? descIn;
  dynamic? descOut;
  DateTime tanggal = DateTime.now();
  dynamic? note;
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),

      body: Form(
          key: _formKey,
          child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                ),
            padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Insert your income!'),
                  Padding(
                      // Menggunakan padding sebesar 8 pixel
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Description Income",
                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                                onChanged: (String? value) {
                                    setState(() {
                                    descIn = value!;
                                    });
                                },
                                // Menambahkan behavior saat data disimpan
                                onSaved: (String? value) {
                                    setState(() {
                                    descIn = value!;
                                    });
                                },
                                // Validator sebagai validasi form
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                    return 'Deskripsi tidak boleh kosong!';
                                    }
                                    return null;
                                },
                                ),
                                TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Nominal",
                                    border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                onChanged: (String? value) {
                                    setState(() {
                                    income = double.tryParse(value!);
                                    });
                                },
                                // Menambahkan behavior saat data disimpan
                                onSaved: (String? value) {
                                    setState(() {
                                    income = double.parse(value!);
                                    });
                                },
                                // Validator sebagai validasi form
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                    return 'Nominal tidak boleh kosong!';
                                    } 
                                    return null;
                                },
                                ),
                                TextButton(
                                    child: const Text(
                                        "Add Income",
                                        style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.green),
                                    ),
                                    onPressed: () {
                                        // if (_formKey.currentState!.validate()) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                            return Dialog(
                                                shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                ),
                                                elevation: 15,
                                                child: Container(
                                                child: ListView(
                                                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                                                    shrinkWrap: true,
                                                    children: <Widget>[
                                                    TextButton(
                                                        onPressed:() async {
                                                      //     final response = await http.post(
                                                      //         Uri.parse('https://nobokekk.up.railway.app/add/add_income_flutter/'),
                                                      //         headers: <String, String>{'Content-Type': 'application/json'},
                                                      //         body: jsonEncode(<String, dynamic>{
                                                      //             'desc_in': descIn,
                                                      //             'income': income,
                                                      //         })
                                                      //     );
                                                      // //         Navigator.pushReplacement(
                                                      // //   context,
                                                      // //   MaterialPageRoute(builder: (context) => const MyKategoriPage()),
                                                      // // );
                                                          if (income != null && descIn != null) {
                                                                  final data = {
                                                                    "income": income.toString(),
                                                                    "desc_in": descIn,
                                                                  };
                                                                  NoBokekApi.addIncome(context, data);
                                                                  // Navigator.pushAndRemoveUntil(
                                                                  //     context,
                                                                  //     MaterialPageRoute(
                                                                  //       builder: (context) => const MainPage(
                                                                  //         page: 3,
                                                                  //       ),
                                                                  //     ),
                                                                  //     (route) => false);
                                                                }
                                                       },
                                                        child: Text('Click ini untuk konfirmasi :)'),
                                                    ), 
                                                    ],
                                                ),
                                                ),
                                            );
                                            },
                                        );
                                        // }
                                    },
                                    ),
                            ])),  
                  Text('Insert your outcome!'),
                  Padding(
                        // Menggunakan padding sebesar 8 pixel
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Description Outcome",
                                  // Menambahkan circular border agar lebih rapi
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                // Menambahkan behavior saat nama diketik
                                  onChanged: (String? value2) {
                                      setState(() {
                                      descOut = value2!;
                                      });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value2) {
                                      setState(() {
                                      descOut = value2!;
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value2) {
                                      if (value2 == null || value2.isEmpty) {
                                      return 'Deskripsi tidak boleh kosong!';
                                      }
                                      return null;
                                  },
                                  ),
                                  TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Nominal",
                                      border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),
                                  onChanged: (String? value2) {
                                      setState(() {
                                      outcome = double.tryParse(value2!);
                                      });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value2) {
                                      setState(() {
                                      outcome = double.parse(value2!);
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value2) {
                                      if (value2 == null || value2.isEmpty) {
                                      return 'Nominal tidak boleh kosong!';
                                      } 
                                      return null;
                                  },
                                  ),
                                  TextButton(
                                      child: const Text(
                                          "Add Outcome",
                                          style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Colors.green),
                                      ),
                                      onPressed: () {
                                          // if (_formKey.currentState!.validate()) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                              return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  elevation: 15,
                                                  child: Container(
                                                  child: ListView(
                                                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                                                      shrinkWrap: true,
                                                      children: <Widget>[
                                                      TextButton(
                                                          onPressed:() async {
                                                            // final response = await http.post(
                                                            //     Uri.parse('https://nobokekk.up.railway.app/add/add_outcome_flutter/'),
                                                            //     headers: <String, String>{'Content-Type': 'application/json'},
                                                            //     body: jsonEncode(<String, dynamic>{
                                                            //         'desc_out': descOut,
                                                            //         'outcome': outcome,
                                                            //     })
                                                            // );
                                                            if (outcome != null && descOut != null) {
                                                              final data = {
                                                                "outcome": outcome.toString(),
                                                                "desc_out": descOut,
                                                              };
                                                              
                                                              NoBokekApi.addOutcome(context, data);
                                                             
                                                              // Navigator.pushAndRemoveUntil(
                                                              //     context,
                                                              //     MaterialPageRoute(
                                                              //       builder: (context) => const MainPage(
                                                              //         page: 3,
                                                              //       ),
                                                              //     ),
                                                              //     (route) => false);
                                                            }
                                                        },
                                                          child: Text('Click ini untuk konfirmasi :)'),
                                                      ), 
                                                      ],
                                                  ),
                                                  ),
                                              );
                                              },
                                          );
                                          // }
                                      },
                                      ),
                              ])),

                    // Text('Insert your note!'),
                    // Padding(
                    //     // Menggunakan padding sebesar 8 pixel
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           TextFormField(
                    //               decoration: InputDecoration(
                    //                   hintText: "Description Note",
                    //               // Menambahkan circular border agar lebih rapi
                    //               border: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(5.0),
                    //               ),
                    //             ),
                    //             // Menambahkan behavior saat nama diketik
                    //               onChanged: (String? value) {
                    //                   setState(() {
                    //                   note = value!;
                    //                   });
                    //               },
                    //               // Menambahkan behavior saat data disimpan
                    //               onSaved: (String? value) {
                    //                   setState(() {
                    //                   note = value!;
                    //                   });
                    //               },
                    //               // Validator sebagai validasi form
                    //               validator: (String? value) {
                    //                   if (value == null || value.isEmpty) {
                    //                   return 'Deskripsi tidak boleh kosong!';
                    //                   }
                    //                   return null;
                    //               },
                    //               ),
                                  
                    //               TextButton(
                    //                   child: const Text(
                    //                       "Add Note",
                    //                       style: TextStyle(color: Colors.white),
                    //                   ),
                    //                   style: ButtonStyle(
                    //                       backgroundColor: MaterialStateProperty.all(Colors.green),
                    //                   ),
                    //                   onPressed: () {
                    //                       // if (_formKey.currentState!.validate()) {
                    //                       showDialog(
                    //                           context: context,
                    //                           builder: (context) {
                    //                           return Dialog(
                    //                               shape: RoundedRectangleBorder(
                    //                               borderRadius: BorderRadius.circular(10),
                    //                               ),
                    //                               elevation: 15,
                    //                               child: Container(
                    //                               child: ListView(
                    //                                   padding: const EdgeInsets.only(top: 20, bottom: 20),
                    //                                   shrinkWrap: true,
                    //                                   children: <Widget>[
                    //                                   TextButton(
                    //                                       onPressed:() async {
                    //                                         if (note != null) {
                    //                                                 final data = {
                    //                                                   "note": note,
                    //                                                 };
                                                                    
                    //                                                 NoBokekApi.addNote(context, data);
                    //                                               }
                    //                                     },
                    //                                       child: Text('Click ini untuk konfirmasi :)'),
                    //                                   ), 
                    //                                   ],
                    //                               ),
                    //                               ),
                    //                           );
                    //                           },
                    //                       );
                    //                       // }
                    //                   },
                    //                   ),
                    //           ])),

                    // Text('Insert your note!'),
                    // Padding(
                    //       // Menggunakan padding sebesar 8 pixel
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             // TextFormField(
                    //             //     decoration: InputDecoration(
                    //             //         hintText: "Notes",
                    //             //     // Menambahkan circular border agar lebih rapi
                    //             //     border: OutlineInputBorder(
                    //             //       borderRadius: BorderRadius.circular(5.0),
                    //             //     ),
                    //             //   ),
                    //             //   // Menambahkan behavior saat nama diketik
                    //             //     onChanged: (String? value) {
                    //             //         setState(() {
                    //             //         note = value!;
                    //             //         });
                    //             //     },
                    //             //     // Menambahkan behavior saat data disimpan
                    //             //     onSaved: (String? value) {
                    //             //         setState(() {
                    //             //         note = value!;
                    //             //         });
                    //             //     },
                    //             //     // Validator sebagai validasi form
                    //             //     validator: (String? value) {
                    //             //         if (value == null || value.isEmpty) {
                    //             //         return 'Deskripsi tidak boleh kosong!';
                    //             //         }
                    //             //         return null;
                    //             //     },
                    //             //     ),
                    //                 Center(
                    //                     child: YellowButton(
                    //                       onPressed: () {
                    //                         showDialog(
                    //                             context: context,
                    //                             builder: (BuildContext context) {
                    //                               return AlertDialog(
                    //                                 scrollable: true,
                    //                                 title: const Text('Add your reminder!'),
                    //                                 content: Padding(
                    //                                   padding: const EdgeInsets.all(8.0),
                    //                                   child: Form(
                    //                                     child: Column(
                    //                                       children: <Widget>[
                                                            
                    //                                         TextFormField(
                    //                                           onChanged: (value) {
                    //                                             note = value;
                    //                                           },
                    //                                           decoration: const InputDecoration(
                    //                                             labelText: 'Note',
                    //                                             icon: Icon(Icons.message),
                    //                                           ),
                    //                                         ),
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 actions: [
                    //                                   YellowButton(
                    //                                       label: "Submit",
                    //                                       onPressed: () {
                    //                                         if (note != null ) {
                    //                                           final data = {
                    //                                             "note": note.toString(),
                    //                                           };
                    //                                           NoBokekApi.addNote(context, data);
                    //                                           print("hai");
                    //                                           // Navigator.pushAndRemoveUntil(
                    //                                           //     context,
                    //                                           //     MaterialPageRoute(
                    //                                           //       builder: (context) => const MainPage(
                    //                                           //         page: 3,
                    //                                           //       ),
                    //                                           //     ),
                    //                                           //     (route) => false);
                    //                                         }
                    //                                       }),
                    //                                 ],
                    //                               );
                    //                             });
                    //                       },
                    //                       label: "Add your reminder!",
                    //                     ),
                    //                   ),
                                      

                                      
                    //                 // TextButton(
                    //                 //     child: const Text(
                    //                 //         "Add Note",
                    //                 //         style: TextStyle(color: Colors.white),
                    //                 //     ),
                    //                 //     style: ButtonStyle(
                    //                 //         backgroundColor: MaterialStateProperty.all(Colors.green),
                    //                 //     ),
                    //                 //     onPressed: () {
                    //                 //         // if (_formKey.currentState!.validate()) {
                    //                 //         showDialog(
                    //                 //             context: context,
                    //                 //             builder: (context) {
                    //                 //             return Dialog(
                    //                 //                 shape: RoundedRectangleBorder(
                    //                 //                 borderRadius: BorderRadius.circular(10),
                    //                 //                 ),
                    //                 //                 elevation: 15,
                    //                 //                 child: Container(
                    //                 //                 child: ListView(
                    //                 //                     padding: const EdgeInsets.only(top: 20, bottom: 20),
                    //                 //                     shrinkWrap: true,
                    //                 //                     children: <Widget>[
                    //                 //                     TextButton(
                    //                 //                         onPressed:() async {
                    //                 //                           final response = await http.post(
                    //                 //                               Uri.parse('https://nobokekk.up.railway.app/add/add_note_flutter/'),
                    //                 //                               headers: <String, String>{'Content-Type': 'application/json'},
                    //                 //                               body: jsonEncode(<String, dynamic>{
                    //                 //                                   'note': note,
                    //                 //                               })
                    //                 //                           );
                    //                 //                       },
                    //                 //                         child: Text('Click ini untuk konfirmasi :)'),
                    //                 //                     ), 
                    //                 //                     ],
                    //                 //                 ),
                    //                 //                 ),
                    //                 //             );
                    //                 //             },
                    //                 //         );
                    //                 //         // }
                    //                 //     },
                    //                 //     ),
                    //             ])),
                      Text('This is your piggybank income!'),
                      Expanded(
                      child: FutureBuilder(
                      future: NoBokekApi.fetchTransactions(context),
                      // future : fetchMoney(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                          // return listview builder
                          return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (_, index)=> Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2.0
                                      )
                                      ]
                                  ),
                                  
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        snapshot.data![index].fields.descIn != null?
                                      Text(
                                          "${snapshot.data![index].fields.descIn}",
                                          style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          ),
                                      ): 
                                      const SizedBox.shrink(),
                                      
                                      
                                      ],
                                  ),
                                  )
                              );
                        } else if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData) {
                          // tampilin kalo misalnya datanya kosong
                          return Column(
                              children: const [
                                  Text(
                                  "Tidak ada note :(",
                                  style: TextStyle(
                                      color: Color(0xff59A5D8),
                                      fontSize: 20),
                                  ),
                                  SizedBox(height: 8),
                              ],
                              );
                        } else {
                          // loading
                          return const Center(child: CircularProgressIndicator(
                            color: ColorPalettes.freshLemon,
                          ));
                        }
                          // if (snapshot.data == null) {
                          // return const Center(child: CircularProgressIndicator());
                          // } else {
                          // if (!snapshot.hasData) {
                          //     return Column(
                          //     children: const [
                          //         Text(
                          //         "Tidak ada note :(",
                          //         style: TextStyle(
                          //             color: Color(0xff59A5D8),
                          //             fontSize: 20),
                          //         ),
                          //         SizedBox(height: 8),
                          //     ],
                          //     );
                          // } else {
                          //     return ListView.builder(
                          //         itemCount: snapshot.data!.length,
                          //         itemBuilder: (_, index)=> Container(
                          //         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          //         padding: const EdgeInsets.all(20.0),
                          //         decoration: BoxDecoration(
                          //             color:Colors.white,
                          //             borderRadius: BorderRadius.circular(15.0),
                          //             boxShadow: const [
                          //             BoxShadow(
                          //                 color: Colors.black,
                          //                 blurRadius: 2.0
                          //             )
                          //             ]
                          //         ),
                                  
                                  
                          //         child: Column(
                          //             mainAxisAlignment: MainAxisAlignment.start,
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: [
                          //               snapshot.data![index].fields.note != null ?
                          //             Text(
                          //                 "${snapshot.data![index].fields.note}",
                          //                 style: const TextStyle(
                          //                 fontSize: 18.0,
                          //                 fontWeight: FontWeight.bold,
                          //                 ),
                          //             ): const SizedBox(),
                                      
                          //             // const SizedBox(height: 10),
                          //             // Text("${snapshot.data![index].completed}"),
                          //             ],
                          //         ),
                          //         )
                          //     );
                          // }
                          // }
                      }
                  ),
                  ),
                ],
              ))),


    );
  }
}