import 'package:fake_store_flutter/features/home/domain/entities/product.dart';

import '../../domain/entities/rating.dart';
import 'rating_model.dart';

class ProductModel extends Product {

  ProductModel({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    RatingModel? rating})
      :super(id: id,title: title,price: price,
            description: description,category: category,
            image:image);

  RatingModel? rating;

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? RatingModel.fromJson(json['rating']) : null;
  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['description'] = description;
    map['category'] = category;
    map['image'] = image;
    if (rating != null) {
      map['rating'] = rating?.toJson();
    }
    return map;
  }

}