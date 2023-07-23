import 'package:shop_app/models/product_details_model.dart';

class CartModel {
  bool status;
  dynamic message;
  CartData data;

  CartModel({
    required this.status,
    this.message,
    required this.data,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json["status"],
        message: json["message"],
        data: CartData.fromJson(json["data"]),
      );
}

class CartData {
  List<CartItem> cartItems;
  double subTotal;
  double total;

  CartData({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        cartItems: List<CartItem>.from(
            json["cart_items"].map((x) => CartItem.fromJson(x))),
        subTotal: json["sub_total"] + 0.0,
        total: json["total"] + 0.0,
      );
}

class CartItem {
  int id;
  int quantity;
  ProductModel product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        quantity: json["quantity"],
        product: ProductModel.fromJson(json["product"]),
      );
}

class ChangeCartModel {
  bool? status;
  String? message;
  ChangeCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
