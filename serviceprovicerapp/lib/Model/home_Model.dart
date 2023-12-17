

class Homemodel {
   List<Product>? products;
   int? total;
   int? skip;
   int?limit;

  Homemodel({
    products,
    total,
    skip,
    limit,
  });

   Homemodel.fromJson(Map<String, dynamic> json) {
    products= List<Product>.from(json["products"].map((x) => Product.fromJson(x)));
    total= json["total"];
    skip= json["skip"];
    limit= json["limit"];
  }

  Map<String, dynamic> toJson()  {
    final data = <String, dynamic>{};
    data["products"]= List<dynamic>.from(products!.map((x) => x.toJson()));
    data["total"]= total;
    data["skip"]= skip;
    data["limit"]= limit;
    return data;
  }
}

class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    discountPercentage: json["discountPercentage"]?.toDouble(),
    rating: json["rating"]?.toDouble(),
    stock: json["stock"],
    brand: json["brand"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "stock": stock,
    "brand": brand,
    "category": category,
    "thumbnail": thumbnail,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
