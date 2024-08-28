

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    List<ProductElement> products;
    int total;
    int skip;
    int limit;

    Product({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

  String? get images => null;

  String? get title => null;

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class ProductElement {
    int id;
    String title;
    String description;
    double price;
    double discountPercentage;
    double rating;
    int stock;
    String brand;
    String category;
    String thumbnail;
    List<String> images;

    ProductElement({
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

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        price: json["price"] ?? 3.3,
        discountPercentage: json["discountPercentage"]?.toDouble() ?? 4.4 ,
        rating: json["rating"]?.toDouble() ?? 5.5,
        stock: json["stock"] ?? 0,
        brand: json["brand"] ?? "",
        category: json["category"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
        images: List<String>.from(json["images"].map((x) => x)) ?? [] ,
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