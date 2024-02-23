class Address {
  String? name;
  String? direccion;
  String? barrio;

  Address({this.name, this.barrio, this.direccion});

  Address.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    barrio = json['barrio'];
    direccion = json['direccion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['barrio'] = barrio;
    data['direccion'] = direccion;
    return data;
  }
}
