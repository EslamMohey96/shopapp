class isFavoritesModel {
  late bool status;
  late Data data;

  isFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] =   new Data.fromJson(json['data']) ;
  }

}

class Data {
  late List<DataF> dataF=[];

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataF = <DataF>[];
      json['data'].forEach((v) {
        dataF.add(new DataF.fromJson(v));
      });
    }
  }

}

class DataF {
  late int id;
  late Product product;


  DataF.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] = new Product.fromJson(json['product']) ;
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
