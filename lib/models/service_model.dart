class ServiceModel {
  String? name;
  String? person;
  String? date;
  String? price;
  String? hour;
  String? category;
  List<String>? ambassador;

  ServiceModel(
      {this.name,
      this.person,
      this.date,
      this.price,
      this.hour,
      this.category,
      this.ambassador});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    person = json['person'];
    date = json['date'];
    price = json['price'];
    hour = json['hour'];
    category = json['category'];
    ambassador = json['ambassador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['person'] = person;
    data['date'] = date;
    data['price'] = price;
    data['hour'] = hour;
    data['category'] = category;
    data['ambassador'] = ambassador;
    return data;
  }
}
