class CoursesModel {
  int? id;
  String? courseName;
  String? trainerName;
  String? coursePhoto;
  String? aboutCourse;
  int? coursePrise;

  CoursesModel(
      {this.id,
        this.courseName,
        this.trainerName,
        this.coursePhoto,
        this.aboutCourse,
        this.coursePrise});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['courseName'];
    trainerName = json['trainerName'];
    coursePhoto = json['coursePhoto'];
    aboutCourse = json['aboutCourse'];
    coursePrise = json['coursePrise'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseName'] = this.courseName;
    data['trainerName'] = this.trainerName;
    data['coursePhoto'] = this.coursePhoto;
    data['aboutCourse'] = this.aboutCourse;
    data['coursePrise'] = this.coursePrise;
    return data;
  }
}
