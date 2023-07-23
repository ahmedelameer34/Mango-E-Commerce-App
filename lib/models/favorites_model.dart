// To parse this JSON data, do
//
//     final favoritesModel = favoritesModelFromJson(jsonString);

class FavoritesModel {
  bool status;
  dynamic message;
  Data? data;

  FavoritesModel({
    required this.status,
    this.message,
    required this.data,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int currentPage;
  List<FavData> favData;
  String firstPageUrl;
  int? from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int? to;
  int total;

  Data({
    required this.currentPage,
    required this.favData,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<FavData> data = [];
    for (var dataJson in json['data']) {
      data.add(FavData.fromJson(dataJson));
    }

    return Data(
      currentPage: json["current_page"],
      favData: data,
      firstPageUrl: json["first_page_url"],
      from: json["from"],
      lastPage: json["last_page"],
      lastPageUrl: json["last_page_url"],
      nextPageUrl: json["next_page_url"],
      path: json["path"],
      perPage: json["per_page"],
      prevPageUrl: json["prev_page_url"],
      to: json["to"],
      total: json["total"],
    );
  }
}

class FavData {
  int id;
  Product product;

  FavData({
    required this.id,
    required this.product,
  });

  factory FavData.fromJson(Map<String, dynamic> json) => FavData(
        id: json["id"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
      };
}

class Product {
  int id;
  double price;
  double oldPrice;
  double discount;
  String image;
  String name;
  String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"] + 0.0,
        oldPrice: json["old_price"] + 0.0,
        discount: json["discount"] + 0.0,
        image: json["image"],
        name: json["name"],
        description: json["description"],
      );
}

class ChangeFavoritesModel {
  bool? status;
  String? message;
  ChangeFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
