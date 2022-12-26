import 'package:fake_store_flutter/core/value/strings.dart';
import 'package:fake_store_flutter/features/home/data/data_sources/local/products_cache.dart';
import 'package:hive/hive.dart';

import '../../models/ProductListModel.dart';
import '../../models/product_model.dart';


class ProductsCacheImpl implements ProductsCache{
  ProductsCacheImpl({required Box box}) : _box = box;
  final Box _box;

  @override
  getProductsCache()async {
    // TODO: implement get
    final encodedJson = _box.get(AppStrings.localStorageKeyText);
    final model =productModelFromJson(encodedJson);
    return model;
  }

  @override
  setProductsCache({required List<ProductModel> products}) async{
    // TODO: implement set
    await _box.put(AppStrings.localStorageKeyText,productModelToJson(products));
  }

}
