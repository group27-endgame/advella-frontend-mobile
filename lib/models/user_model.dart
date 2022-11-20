class UserModel {
  final int userId;
  final String userEmail;
  final String description;
  final String? token;

  UserModel(
      {required this.userId,
      required this.userEmail,
      required this.description,
      this.token});

  static UserModel fromJson(json) {
    return UserModel(
        userId: json['userId'],
        userEmail: json['email'],
        description: json['description']);
  }

  static Map<String, dynamic> toJson(UserModel user) {
    Map<String, dynamic> jsonMap = {
      "userId": user.userId,
      "email": user.userEmail,
      "description": user.description,
      "token": user.token,
    };

    return jsonMap;
  }
}
