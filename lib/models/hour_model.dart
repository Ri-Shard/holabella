class Schedule {
  String? hour;
  int? status;

  Schedule({this.hour, this.status});

  Schedule.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hour'] = hour;
    data['status'] = status;
    return data;
  }
}
