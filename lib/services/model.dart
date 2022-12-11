class User {
  String? firstName;
  String? lastName;

  User({required this.firstName, required this.lastName});

  User.fromJson(Map<String,dynamic> json){
    firstName=json['first_name'] ??"";
    lastName=json['last_name'] ??"";
  }
}
