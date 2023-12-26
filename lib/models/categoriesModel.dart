class categoriesModel {
  late bool status;
  late dataModel data;

  categoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = dataModel.fromJson(json['data']);
  }
}

class dataModel {
  late List<data> dataM = [];
  late int currentPage;
  dataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      dataM.add(data.fromJson(element));
    });
  }
}

class data {
  late int id;
  late String name;
  late String image;
  data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
