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
  final String? category;
  final String? product;

  Banner({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      image: json['image'],
      category: json['category'],
      product: json['product'],
    );
  }
}

class Category {
  int id;
  String image;
  String name;

  Category({
    required this.id,
    required this.image,
    required this.name,
  });
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
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images']),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
