class UserModel
{
  final int userId;
  final String userEmail;
  final String token;

  UserModel({required this.userId, required this.userEmail, required this.token});

  static UserModel fromJson(json)
  {
    return UserModel(userId: json['userId'], userEmail: json['userEmail'], token: json['token']);
  }

  static Map<String, dynamic> toJson(UserModel user) {
    Map<String, dynamic> jsonMap = {
      "userId": user.userId,
      "userEmail": user.userEmail,
      "token": user.token,
    };

    return jsonMap;
  }
}