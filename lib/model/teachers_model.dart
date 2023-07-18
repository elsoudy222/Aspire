class TeachersModel {
  String? teacherName;

  TeachersModel({this.teacherName});

  TeachersModel.fromJson(Map<String, dynamic> json) {
    teacherName = json['teacherName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teacherName'] = this.teacherName;
    return data;
  }
}
