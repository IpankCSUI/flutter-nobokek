import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';
import 'package:flutter_nobokek/widgets/big_text_field.dart';
import 'package:flutter_nobokek/widgets/custom_text_field.dart';
import 'package:flutter_nobokek/widgets/forum_card.dart';
import 'package:flutter_nobokek/widgets/yellow_button.dart';
import 'package:flutter_nobokek/models/pendapatForum.dart';
import 'package:flutter_nobokek/function/api.dart';
import 'package:flutter_nobokek/page/main_page.dart';

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
            FutureBuilder(
              future: NoBokekApi.fetchUsername(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Text(
                    'Hello, ${snapshot.data}!',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return const Text(
                      "Gagal mendapatkan data username pengguna.");
                } else {
                  return const Text("Sedang mendapatkan data.");
                }
              },
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
                onPressed: () {
                  if (nama != null && jurusan != null && angkatan != null && pendapat != null) {
                      final data = {
                        "nama": nama,
                        "jurusan": jurusan,
                        "angkatan": angkatan,
                        "pendapat": pendapat,
                        };
                      NoBokekApi.addForum(context,data);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(
                              page: 3,
                            ),
                          ),
                          (route) => false);
                  }
                },
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
            FutureBuilder(
              future: NoBokekApi.fetchForum(context),
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
                        child: ForumCard(
                          nama: snapshot.data![index].nama,
                          jurusan: snapshot.data![index].jurusan,
                          angkatan: snapshot.data![index].angkatan,
                          pesan: snapshot.data![index].pendapat,
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
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
