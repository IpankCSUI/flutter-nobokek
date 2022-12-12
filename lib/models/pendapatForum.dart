// To parse this JSON data, do
//
//     final money = moneyFromJson(jsonString);

class PendapatForum {
  final int pk;
  final String nama;
  final String jurusan;
  final String angkatan;
  final String pendapat;

  PendapatForum({
    required this.pk,
    required this.nama,
    required this.jurusan,
    required this.angkatan,
    required this.pendapat,
  });

  factory PendapatForum.fromJson(Map<String, dynamic> json) => PendapatForum(
        pk: json["pk"],
        nama: json["fields"]["nama"],
        jurusan: json["fields"]["jurusan"],
        angkatan: json["fields"]["angkatan"],
        pendapat: json["fields"]["pendapat"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "jurusan": jurusan,
        "angkatan" : angkatan,
        "pendapat" : pendapat,
      };
}
