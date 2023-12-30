class isFavoritesModel {
  late bool status;
  Data? data;

  isFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<DataF> dataF = [];

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'].length!=0) {
      dataF = <DataF>[];
      json['data'].forEach((v) {
        dataF.add(new DataF.fromJson(v));
      });
    } else {
      dataF = [];
    }
  }
}

class DataF {
  late int id;
  Product? product;

  DataF.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}

class Product {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
