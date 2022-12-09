import 'dart:convert';

import 'package:http/http.dart';

class ContactUsService
{
  final String url = "https://api.advella.popal.dev/api/contacts";

  Future postContactUs(String? access_token, String content) async
  {
    try{
      Map<String, dynamic> jsonMap = {
        "content": content,
      };

      Response response = await post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $access_token"
          },
          body: jsonEncode(jsonMap)
      );
    } catch(e) {
      print(e.toString());
    }
  }
}