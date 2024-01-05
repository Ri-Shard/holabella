class ServiceModel {
  String? name;
  String? person;
  String? date;
  String? price;

  ServiceModel({this.name, this.person, this.date, this.price});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    person = json['person'];
    date = json['date'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['person'] = person;
    data['date'] = date;
    data['price'] = price;
    return data;
  }
}
