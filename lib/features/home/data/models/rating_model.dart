import 'package:fake_store_flutter/features/home/domain/entities/rating.dart';

class RatingModel extends Rating{
  RatingModel({
      double? rate,
      int? count,}):super(rate:rate,count: count);

  RatingModel.fromJson(dynamic json) {
    rate = json['rate'];
    count = json['count'];
  }
  double? rate;
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = rate;
    map['count'] = count;
    return map;
  }

}