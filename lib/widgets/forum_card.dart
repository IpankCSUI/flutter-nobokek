import "package:flutter/material.dart";

class ForumCard extends StatelessWidget {
  final String nama;
  final String jurusan;
  final String angkatan;
  final String pesan;
  const ForumCard({
    super.key,
    required this.nama,
    required this.jurusan,
    required this.angkatan,
    required this.pesan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pesan),
          const Spacer(),
          Text(jurusan),
          Text(angkatan),
          Text(nama),
        ],
      ),
    );
  }
}
