class ProductCategory
{
  final int productCategoryId;
  final String title;

  ProductCategory({required this.productCategoryId, required this.title});

  static ProductCategory fromJson(json)
  {
    return ProductCategory(
        productCategoryId: json['productCategoryId'],
        title: json['title']
    );
  }

  static Map<String, dynamic> toJson(ProductCategory productCategory)
  {
    Map<String, dynamic> jsonMap = {
      "productCategoryId": productCategory.productCategoryId,
      "title": productCategory.title
    };
    return jsonMap;
  }
}