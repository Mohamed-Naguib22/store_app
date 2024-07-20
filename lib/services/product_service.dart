import 'package:dio/dio.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/utils/constants.dart';

class ProductService {
  final Dio dio;
  ProductService(this.dio);

  Future<List<Product>> getAllProducts() async {
    var response = await dio.get("$baseUrl$productRoute");

    List<dynamic> products = response.data;
    List<Product> productList = [];

    for (var product in products) {
      productList.add(Product.fromJson(product));
    }

    print(productList);
    return productList;
  }

  Future<List<dynamic>> getAllCategories() async {
    var response = await dio.get("$baseUrl$productRoute/categories");

    return response.data;
  }

  Future<List<Product>> getProductsByCategory({required categoryName}) async {
    var response =
        await dio.get("$baseUrl$productRoute/category/$categoryName");

    return response.data;
  }
}
