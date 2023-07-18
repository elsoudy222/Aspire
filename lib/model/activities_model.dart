class ActivitiesModel {
  int? id;
  String? actvName;
  String? actvPhoto;

  ActivitiesModel({this.id, this.actvName, this.actvPhoto});

  ActivitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    actvName = json['actvName'];
    actvPhoto = json['actvPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['actvName'] = this.actvName;
    data['actvPhoto'] = this.actvPhoto;
    return data;
  }
}
