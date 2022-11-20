class ServiceImage
{
  final int id;
  final String path;

  ServiceImage({required this.id, required this.path});

  static ServiceImage fromJson(json)
  {
    return ServiceImage(
        id: json['id'],
        path: json['path']
    );
  }

  static Map<String, dynamic> toJson(ServiceImage serviceImage)
  {
    Map<String, dynamic> jsonMap = {
      "id": serviceImage.id,
      "path": serviceImage.path
    };
    return jsonMap;
  }
}