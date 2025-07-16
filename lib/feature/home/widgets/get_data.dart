 import 'package:api1/feature/models/product_model.dart';
import 'package:dio/dio.dart';

final Dio dio = Dio();

  Future<List<ProductModel>> getData(String url) async {
    final response = await dio.get(
      url,
    );
    List data = response.data;

    List<ProductModel> listProduct = data
        .map((e) => ProductModel.fromjson(e))
        .toList();
    return listProduct;
  }