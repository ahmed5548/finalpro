import 'dart:convert';
import 'package:finalpro/moduls/categoryfile.dart';
import 'package:finalpro/moduls/elementfile.dart';
import 'package:finalpro/screens/main.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<ProductsVm> getProducts() async
  {
    String url = "https://retail.amit-learning.com/api/products";
    final response = await http.get(Uri.parse(url));
    return ProductsVm.fromJson(Map<String, dynamic>.from(json.decode(response.body.toString())));
  }

  static Future<CategoriesVm> getCategories() async
  {
    String url = "https://retail.amit-learning.com/api/categories";
    final response = await http.get(Uri.parse(url));
    return CategoriesVm.fromJson(Map<String, dynamic>.from(json.decode(response.body.toString())));
  }
}
