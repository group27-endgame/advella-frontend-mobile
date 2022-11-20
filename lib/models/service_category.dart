class ServiceCategory
{
  final int serviceCategoryId;
  final String title;

  ServiceCategory({required this.serviceCategoryId, required this.title});

  static ServiceCategory fromJson(json)
  {
    return ServiceCategory(
        serviceCategoryId: json['serviceCategoryId'],
        title: json['title']
    );
  }

  static Map<String, dynamic> toJson(ServiceCategory serviceCategory)
  {
    Map<String, dynamic> jsonMap = {
      "serviceCategoryId": serviceCategory.serviceCategoryId,
      "title": serviceCategory.title
    };
    return jsonMap;
  }
}