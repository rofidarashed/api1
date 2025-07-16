class ProductModel {
  final String image;
  final String title;
  final String description;
  final dynamic price;

  ProductModel({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

factory ProductModel.fromjson(final Map<String, dynamic> data) {
  return ProductModel(
    image: data['image'],
    title: data['title'],
    description: data['description'],
    price: data['price'],
  );
}
}
