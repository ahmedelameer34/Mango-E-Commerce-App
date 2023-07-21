import 'home_model.dart';

class CartModel {
  bool status;
  dynamic message;
  Data data;

  CartModel({
    required this.status,
    this.message,
    required this.data,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  List<CartItem> cartItems;
  int subTotal;
  int total;

  Data({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartItems: List<CartItem>.from(
            json["cart_items"].map((x) => CartItem.fromJson(x))),
        subTotal: json["sub_total"],
        total: json["total"],
      );
}

class CartItem {
  int id;
  int quantity;
  Product product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        quantity: json["quantity"],
        product: Product.fromJson(json["product"]),
      );
}
