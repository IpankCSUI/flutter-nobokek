// import 'package:flutter/material.dart';
// import 'package:flutter_nobokek/Screens/Signup/tampilan_daftar.dart';
// import 'package:flutter_nobokek/Screens/Welcome/tampilan_welcome.dart';
// import 'package:flutter_nobokek/components/daftar_button.dart';
// import 'package:flutter_nobokek/login/login.dart';

// class Body extends StatelessWidget {
//   @override
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

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//           backgroundColor: Color(0xFFC37B89),
//         ),
//         body: Form(
//           key: formKey,
//           child: ListView(
//             // margin: EdgeInsets.symmetric(vertical: 6),
//             padding: EdgeInsets.all(17),

//             children: [
//               const SizedBox(height: 30),
//               buildButton1(),
//               const SizedBox(height: 15),
//               buildButton2(),
//               const SizedBox(height: 8),
//             ],
//           ),
//         ),
//       );

//   Widget buildButton1() => Builder(
//         builder: (context) => ButtonWidget(
//           text: 'MASUK',
//           onClicked: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return const LoginPage();
//                 },
//               ),
//             );
//           },
//         ),
//       );
//   Widget buildButton2() => Builder(
//         builder: (context) => ButtonWidget(
//           text: 'DAFTAR',
//           onClicked: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return SignUpScreen();
//                 },
//               ),
//             );
//           },
//         ),
//       );
// }