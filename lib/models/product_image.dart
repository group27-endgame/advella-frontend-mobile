class ProductImage
{
  final int id;
  final String path;

  ProductImage({required this.id, required this.path});

  static ProductImage fromJson(json)
  {
    return ProductImage(
        id: json['id'],
        path: json['path']
    );
  }

  static Map<String, dynamic> toJson(ProductImage productImage)
  {
    Map<String, dynamic> jsonMap = {
      "id": productImage.id,
      "path": productImage.path
    };
    return jsonMap;
  }
}