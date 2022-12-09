class ContactUs
{
  final String content;

  ContactUs(this.content);

  static Map<String, dynamic> toJson(ContactUs contactUs) {
    Map<String, dynamic> jsonMap = {
      "content": contactUs.content,
    };

    return jsonMap;
  }
}