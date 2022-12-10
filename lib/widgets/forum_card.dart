import "package:flutter/material.dart";

class ForumCard extends StatelessWidget {
  final String nama;
  final String pesan;
  const ForumCard({
    super.key,
    required this.nama,
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
          Text(nama),
        ],
      ),
    );
  }
}
