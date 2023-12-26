class favoritesModel {
  late bool status;
  late String message;
  favoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
