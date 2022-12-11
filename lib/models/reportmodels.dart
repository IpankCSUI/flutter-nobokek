// To parse this JSON data, do
//
//     final money = moneyFromJson(jsonString);

class Target {
  final int user;
  final String title;
  final String desc;
  final bool is_finished;

  Target( {
    required this.user, required this.title, required this.desc, required this.is_finished,
  });  

  factory Target.fromJson(Map<String,dynamic> json) => Target(
    user: json["user"],
    title: json["title"],
    desc: json["description"],
    is_finished: json["is_finished"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": desc,
  };
}