class ListUserModel {
  ListUserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory ListUserModel.fromJson(Map<String, dynamic> json) => ListUserModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
      };
}
