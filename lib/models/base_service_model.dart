class BaseServiceModel {
  String? name;
  String? price;
  String? category;
  List<Map>? ambassador;

  BaseServiceModel({this.name, this.price, this.category, this.ambassador});

  BaseServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    category = json['category'];
    ambassador = json['ambassador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['category'] = category;
    data['ambassador'] = ambassador;
    return data;
  }
}
