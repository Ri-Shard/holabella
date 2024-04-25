class ServiceModel {
  String? name;
  String? person;
  String? date;
  String? price;
  String? hour;
  String? category;
  int? id_service;
  String? user_email;
  String? ambassador;

  ServiceModel(
      {this.name,
      this.person,
      this.date,
      this.price,
      this.hour,
      this.category,
      this.id_service,
      this.user_email,
      this.ambassador});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    person = json['person'];
    date = json['date'];
    price = json['price'];
    hour = json['hour'];
    category = json['category'];
    user_email = json['user_email'];
    ambassador = json['ambassador'];
    id_service = json['id_service'];
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
    data['user_email'] = user_email;
    return data;
  }
}
