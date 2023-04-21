class SharedPrefModel {
  String? email;
  String? uid;
  String? date;

  SharedPrefModel({required this.email, required this.uid, required this.date});

  SharedPrefModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        uid = json['uid'],
        date = json['date'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'uid': uid,
        'date': date,
      };
}
