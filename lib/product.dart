class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json["id"] as int,
      json["title"] as String,
      double.parse(json["price"].toString()),
      json["description"] as String,
      json["image"] as String,
    );
  }

  Product(this.id, this.title, this.price, this.description, this.image);
}
