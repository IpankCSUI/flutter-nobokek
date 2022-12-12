// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_nobokek/Screens/Welcome/tampilan_welcome.dart';
// import 'package:flutter_nobokek/components/daftar_button.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'package:flutter_nobokek/login/login.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   runApp(Body());
// }

// Future<http.Response> registFlutter(
//     String username, String email, String password) {
//   return http.post(
//     Uri.parse('http://127.0.0.1:8000/daftar/flutterregist'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8'
//     },
//     body: jsonEncode(<String, String>{
//       'username': username,
//       'email': email,
//       'password': password,
//       'btnradio': 'pemberi'
//     }),
//   );
// }

// class Body extends StatelessWidget {
//   static final String title = 'HelPINK U';

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(primaryColor: Color(0xFFC37B89)),
//         home: MainPage(
//           title: title,
//         ),
//       );
// }

// class MainPage extends StatefulWidget {
//   final String title;

//   const MainPage({
//     required this.title,
//   });

//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   final formKey = GlobalKey<FormState>();
//   String username = '';
//   String email = '';
//   String password = '';
//   int selected = 1;

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//           backgroundColor: Color(0xFFC37B89),
//         ),
//         body: Container(
//           margin: const EdgeInsets.all(90),
//           padding: EdgeInsets.all(5),
//           color: Color(0xFFC37B89),
//           child: Form(
//             key: formKey,
//             child: ListView(
//               // margin: EdgeInsets.symmetric(vertical: 6),
//               padding: EdgeInsets.all(17),

//               children: [
//                 buildText(),
//                 const SizedBox(height: 30),
//                 buildUsername(),
//                 const SizedBox(height: 8),
//                 buildText2(),
//                 const SizedBox(height: 7),
//                 buildEmail(),
//                 const SizedBox(height: 15),
//                 buildPassword(),
//                 const SizedBox(height: 8),
//                 buildText3(),
//                 const SizedBox(height: 7),
//                 buildText4(),
//                 const SizedBox(height: 7),
//                 buildText5(),
//                 const SizedBox(height: 7),
//                 buildText6(),
//                 const SizedBox(height: 7),
//                 buildRepassword(),
//                 const SizedBox(height: 7),
//                 buildText7(),
//                 const SizedBox(height: 7),
//                 customRadio("Pemberi", 1),
//                 const SizedBox(height: 15),
//                 customRadio("Penerima", 2),
//                 const SizedBox(height: 15),
//                 buildSubmit(),
//                 const SizedBox(height: 15),
//                 buildCek(),
//               ],
//             ),
//           ),
//         ),
//       );

//   Widget buildText() => const Text(
//         "DAFTAR AKUN",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 22,
//           fontWeight: FontWeight.w500,
//         ),
//         textAlign: TextAlign.center,
//       );
//   Widget buildUsername() => TextFormField(
//         // cursorColor: b,
//         decoration: InputDecoration(
//           hintText: "Username...",
//           fillColor: Colors.white,
//           filled: true,

//           prefixIcon: Icon(
//             Icons.account_box,
//             color: Colors.yellow[700],
//           ),

//           border: const OutlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFFC37B89))),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFFC37B89), width: 2),
//           ),
//           // errorBorder:
//           //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
//           // focusedErrorBorder:
//           //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
//           // errorStyle: TextStyle(color: Colors.purple),
//         ),
//         validator: (value) {
//           if (value.length < 4) {
//             return 'Username minimal 4 karakter';
//           } else {
//             return null;
//           }
//         },
//         onSaved: (value) => setState(() => username = value!),
//       );
//   Widget buildText2() => const Text(
//         "Username hanya dapat terdiri dari huruf, angka, dan @/./+/-/_ saja",
//         style: TextStyle(color: Colors.white, fontSize: 12),
//       );
//   Widget buildEmail() => TextFormField(
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             Icons.mail,
//             color: Colors.yellow[700],
//           ),
//           fillColor: Colors.white,
//           filled: true,
//           hintText: "Email...",
//           border: const OutlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFFC37B89))),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFFC37B89), width: 2),
//           ),
//         ),
//         validator: (value) {
//           const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
//           final regExp = RegExp(pattern);

//           if (value!.isEmpty) {
//             return 'Silakan masukkan email';
//           } else if (!regExp.hasMatch(value)) {
//             return 'Email tidak sesuai';
//           } else {
//             return null;
//           }
//         },
//         keyboardType: TextInputType.emailAddress,
//         onSaved: (value) => setState(() => email = value!),
//       );

//   Widget buildPassword() => TextFormField(
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             Icons.lock,
//             color: Colors.yellow[700],
//           ),
//           fillColor: Colors.white,
//           filled: true,
//           hintText: "Enter Password...",
//           border: const OutlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFFC37B89))),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFFC37B89), width: 2),
//           ),
//         ),
//         validator: (value) {
//           if (value.length < 8) {
//             return 'Password minimal 8 karakter';
//           } else {
//             return null;
//           }
//         },
//         onSaved: (value) => setState(() => password = value!),
//         keyboardType: TextInputType.visiblePassword,
//         obscureText: true,
//       );
//   Widget buildText3() => const Text(
//         "     - password harus mengandung minimal setidaknya 8 karakter",
//         style: TextStyle(color: Colors.white, fontSize: 12),
//       );
//   Widget buildText4() => const Text(
//         "     - password tidak boleh mirip dengan data yang lain",
//         style: TextStyle(color: Colors.white, fontSize: 12),
//       );
//   Widget buildText5() => const Text(
//         "     - password tidak boleh yang sering digunakan",
//         style: TextStyle(color: Colors.white, fontSize: 12),
//       );
//   Widget buildText6() => const Text(
//         "     - password tidak boleh seluruhnya angka",
//         style: TextStyle(color: Colors.white, fontSize: 12),
//       );
//   Widget buildRepassword() => TextFormField(
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             Icons.lock,
//             color: Colors.yellow[700],
//           ),
//           fillColor: Colors.white,
//           filled: true,
//           hintText: "Re-enter Password...",
//           border: const OutlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFFC37B89))),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Color(0xFFC37B89), width: 2),
//           ),
//         ),
//         validator: (value) {
//           if (value.length < 8) {
//             return 'Password tidak sesuai';
//           } else {
//             return null;
//           }
//         },
//         onSaved: (value) => setState(() => password = value!),
//         keyboardType: TextInputType.visiblePassword,
//         obscureText: true,
//       );
//   Widget buildText7() => const Text(
//         "Pilih Role:",
//         style: TextStyle(
//             color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
//       );
//   Widget customRadio(String text, int index) {
//     // ignore: deprecated_member_use
//     return OutlineButton(
//       onPressed: () {
//         setState(() {
//           selected = index;
//         });
//       },
//       child: Text(
//         text,
//         style: TextStyle(
//           color:
//               (selected == index) ? Colors.lightBlue[800] : Colors.yellow[700],
//         ),
//       ),
//       color: const Color(0xFFC37B89),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
//       borderSide: BorderSide(
//           color:
//               (selected == index) ? Colors.lightBlue[800] : Colors.yellow[700]),
//     );
//   }

//   Widget buildSubmit() => Builder(
//         builder: (context) => ButtonWidget(
//           text: 'DAFTAR',
//           onClicked: () {
//             final isValid = formKey.currentState!.validate();
//             // FocusScope.of(context).unfocus();

//             if (isValid) {
//               formKey.currentState?.save();
//               registFlutter(username, email, password);

//               final message =
//                   'Username: $username\nPassword: $password\nEmail: $email';
//               final snackBar = SnackBar(
//                 content: Text(
//                   message,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//                 backgroundColor: Colors.green,
//               );
//               ScaffoldMessenger.of(context).showSnackBar(snackBar);
//             }
//           },
//         ),
//       );
//   Widget buildCek() => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const Text(
//             "Sudah punya akun ? ",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return const LoginPage();
//                   },
//                 ),
//               );
//             },
//             child: Text(
//               "Masuk",
//               style: TextStyle(
//                 color: Colors.yellow[700],
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           )
//         ],
//       );
// }