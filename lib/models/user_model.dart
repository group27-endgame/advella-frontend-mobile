class UserModel
{
  final int userId;
  final String userEmail;
  final String? token;

  UserModel({required this.userId, required this.userEmail, this.token});

  static UserModel fromJson(json)
  {
    return UserModel(userId: json['userId'], userEmail: json['email']);
  }

  static Map<String, dynamic> toJson(UserModel user) {
    Map<String, dynamic> jsonMap = {
      "userId": user.userId,
      "email": user.userEmail,
      "token": user.token,
    };

    return jsonMap;
  }
}