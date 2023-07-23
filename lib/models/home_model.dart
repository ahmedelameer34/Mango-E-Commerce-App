import 'package:shop_app/models/product_details_model.dart';

class HomeModel {
  bool? status;

  Data? data;

  HomeModel({
    required this.status,
    required this.data,
  });
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  List<Banner>? banners;
  List<ProductModel>? products;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((element) {
        banners!.add(Banner.fromJson(element));
      });
    }
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((element) {
        products!.add(ProductModel.fromJson(element));
      });
    }
  }
}

class Banner {
  final int id;
  final String image;

  Banner({
    required this.id,
    required this.image,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      image: json['image'],
    );
  }
}
