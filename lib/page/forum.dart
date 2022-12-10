import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';
import 'package:flutter_nobokek/widgets/big_text_field.dart';
import 'package:flutter_nobokek/widgets/custom_text_field.dart';
import 'package:flutter_nobokek/widgets/forum_card.dart';
import 'package:flutter_nobokek/widgets/yellow_button.dart';

class MyForumPage extends StatefulWidget {
  const MyForumPage({super.key});

  @override
  State<MyForumPage> createState() => _MyForumPageState();
}

class _MyForumPageState extends State<MyForumPage> {
  String? nama;
  String? jurusan;
  String? angkatan;
  String? pendapat;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Ocit!",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 48),
            Text(
              "Nama",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              onChanged: (text) {
                nama = text;
              },
            ),
            const SizedBox(height: 16),
            Text(
              "Jurusan",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              onChanged: (text) {
                jurusan = text;
              },
            ),
            const SizedBox(height: 16),
            Text(
              "Angkatan",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              onChanged: (text) {
                angkatan = text;
              },
            ),
            const SizedBox(height: 16),
            Text(
              "Pendapat",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            BigTextField(
              onChanged: (text) {
                pendapat = text;
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: YellowButton(
                label: "Tambah",
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Daftar Forum",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: ((context, index) {
                return const ForumCard(
                  nama: "-Wakway",
                  pesan: "Cemas ko dekk bek bek bek",
                );
              }),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
