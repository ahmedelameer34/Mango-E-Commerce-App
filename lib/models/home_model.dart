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
  final List<Banner> banners;
  final List<Product> products;

  Data({required this.banners, required this.products});

  factory Data.fromJson(Map<String, dynamic> json) {
    List<Banner> banners = [];
    List<Product> products = [];

    for (var bannerJson in json['banners']) {
      banners.add(Banner.fromJson(bannerJson));
    }

    for (var productJson in json['products']) {
      products.add(Product.fromJson(productJson));
    }

    return Data(banners: banners, products: products);
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

class Product {
  final int id;
  final double price;
  final double oldPrice;
  final double discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: json['price'] + 0.0,
      oldPrice: json['old_price'] + 0.0,
      discount: json['discount'] + 0.0,
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images']),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
