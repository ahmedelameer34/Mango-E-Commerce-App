class ProductDetails {
  bool status;
  dynamic message;
  Data data;

  ProductDetails({
    required this.status,
    this.message,
    required this.data,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int id;
  int price;
  int oldPrice;
  int discount;
  String image;
  String name;
  String description;
  bool inFavorites;
  bool inCart;
  List<String> images;

  Data({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart,
    required this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        price: json["price"] + 0.0,
        oldPrice: json["old_price"] + 0.0,
        discount: json["discount"] + 0.0,
        image: json["image"],
        name: json["name"],
        description: json["description"],
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
        images: List<String>.from(json["images"].map((x) => x)),
      );
}
