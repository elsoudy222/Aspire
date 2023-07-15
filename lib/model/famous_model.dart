class FamousModel {
  int? id;
  String? celeName;
  String? celePhoto;
  String? aboutcele;

  FamousModel({this.id, this.celeName, this.celePhoto, this.aboutcele});

  FamousModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    celeName = json['celeName'];
    celePhoto = json['celePhoto'] ?? "";
    aboutcele = json['aboutcele'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['celeName'] = this.celeName;
    data['celePhoto'] = this.celePhoto;
    data['aboutcele'] = this.aboutcele;
    return data;
  }
}
