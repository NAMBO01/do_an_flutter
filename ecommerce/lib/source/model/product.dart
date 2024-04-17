class Product {
  int id;
  String name;
  String category;
  String image;
  double price;
  bool isliked;
  bool isSelected;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.isliked,
    this.isSelected = false,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      isliked: json['isliked'] as bool,
      isSelected: json['isSelected'] as bool? ?? false,
      image: json['image'] as String,
    );
  }

  get availableSizes => null;
}
