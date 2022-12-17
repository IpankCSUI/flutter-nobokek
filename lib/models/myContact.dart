// To parse this JSON data, do
//
//     final money = moneyFromJson(jsonString);

class ContactList {
  final int pk;
  final int user;
  final String alamat;
  final String masalah;


  ContactList({
    required this.pk,
    required this.user,
    required this.alamat,
    required this.masalah,
  });

  factory ContactList.fromJson(Map<String, dynamic> json) => ContactList(
      pk: json["pk"],
      user: json["user"],
      alamat: json["fields"]["alamat"],
      masalah: json["fields"]["masalah"],
    );

  Map<String, dynamic> toJson() => {
    "alamat": alamat,
    "masalah": masalah,
  };
}