
///entity based
// class ProductModel extends Product {
//
//   ProductModel({
//     int? id,
//     String? title,
//     double? price,
//     String? description,
//     String? category,
//     String? image,
//     RatingModel? rating})
//       :super(id: id,title: title,price: price,
//             description: description,category: category,
//             image:image);
//
//   RatingModel? rating;
//
//   ProductModel.fromJson(dynamic json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     category = json['category'];
//     image = json['image'];
//     rating = json['rating'] != null ? RatingModel.fromJson(json['rating']) : null;
//   }
//
//
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['title'] = title;
//     map['price'] = price;
//     map['description'] = description;
//     map['category'] = category;
//     map['image'] = image;
//     if (rating != null) {
//       map['rating'] = rating?.toJson();
//     }
//     return map;
//   }
//
// }

///entity based ends
///
///

///json to dart
// class ProductModel {
//   ProductModel({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.category,
//     this.image,
//     this.rating,});
//
//   ProductModel.fromJson(dynamic json) {
//
//     print("inside model start");
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     category = json['category'];
//     image = json['image'];
//     rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
//
//     print("inside model ends");
//   }
//   int? id;
//   String? title;
//   double? price;
//   String? description;
//   String? category;
//   String? image;
//   Rating? rating;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['title'] = title;
//     map['price'] = price;
//     map['description'] = description;
//     map['category'] = category;
//     map['image'] = image;
//     if (rating != null) {
//       map['rating'] = rating?.toJson();
//     }
//     return map;
//   }
//
// }
//
// class Rating {
//   Rating({
//     this.rate,
//     this.count,});
//
//   Rating.fromJson(dynamic json) {
//     rate = json['rate'];
//     count = json['count'];
//   }
//   double? rate;
//   int? count;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['rate'] = rate;
//     map['count'] = count;
//     return map;
//   }
//
// }

///json to dart


// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

// ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
//
// String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating!.toJson(),
  };
}

class Rating {
  Rating({
    this.rate,
    this.count,
  });

  double? rate;
  int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}
