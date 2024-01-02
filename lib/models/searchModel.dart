class searchModel {
  late bool status;
  Data? data;

  searchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    print("${json['status']} from search model");
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<DataD>? data;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataD>[];
      json['data'].forEach((v) {
        data!.add(new DataD.fromJson(v));
      });
    }
  }
}

class DataD {
  late int id;
  late dynamic price;
  late String image;
  late String name;
  late String description;
  late List<String> images;
  late bool inFavorites;
  late bool inCart;

  DataD.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
