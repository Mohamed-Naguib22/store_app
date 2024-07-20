import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/utils/constants.dart';

class ProductService {
  ProductService();

  Future<List<Product>> getAllProducts() async {
    List<dynamic> products = await Api(dio: Dio()).get(url: "$baseUrl$productRoute");

    return products.map((product) => Product.fromJson(product)).toList();
  }

  Future<List<dynamic>> getAllCategories() async {
    return await Api(dio: Dio()).get(url: "$baseUrl$productRoute/categories");
  }

  Future<List<Product>> getProductsByCategory({required categoryName}) async {
    List<dynamic> products = await Api(dio: Dio()).get(url: "$baseUrl$productRoute/category/$categoryName");

    return products.map((product) => Product.fromJson(product)).toList();
  }

  Future<dynamic> addProduct({required Product product}) async {
    var response = await Api(dio: Dio()).post(url: "$baseUrl$productRoute", body: product.toJson(), token: null);

    return response;
  }

  Future<dynamic> updateProduct({required Product product, required int id}) async {
    var response = await Api(dio: Dio()).put(url: "$baseUrl$productRoute/$id", body: product.toJson(), token: null);

    return response;
  }
}
