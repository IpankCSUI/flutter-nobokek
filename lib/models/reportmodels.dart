// To parse this JSON data, do
//
//     final money = moneyFromJson(jsonString);

class Target {
  final int pk;
  final int user;
  final String title;
  final String desc;
  final bool isFinished;

  Target({
    required this.user,
    required this.pk,
    required this.title,
    required this.desc,
    required this.isFinished,
  });

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        pk: json["pk"],
        user: json["fields"]["user"],
        title: json["fields"]["title"],
        desc: json["fields"]["description"],
        isFinished: json["fields"]["is_finished"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": desc,
      };
}
