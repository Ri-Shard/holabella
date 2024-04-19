class ServiceModel {
  String? name;
  String? person;
  String? date;
  String? price;
  String? hour;
  String? category;
  String? id;
  String? user;
  String? ambassador;

  ServiceModel(
      {this.name,
      this.person,
      this.date,
      this.price,
      this.hour,
      this.category,
      this.id,
      this.user,
      this.ambassador});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    person = json['person'];
    date = json['date'];
    price = json['price'];
    hour = json['hour'];
    category = json['category'];
    user = json['user'];
    ambassador = json['ambassador'];
    id = json['id'];
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
    data['id'] = id;
    data['user'] = user;
    return data;
  }
}
