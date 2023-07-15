
class BannersModel {
  int? id;
  String? mainTitle;
  String? subTitle;
  String? aboutNews;
  String? newsPhoto;



  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainTitle = json['mainTitle'];
    subTitle = json['subTitle'];
    aboutNews = json['aboutNews'];
    newsPhoto = json['newsPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['mainTitle'] = mainTitle;
    data['subTitle'] = subTitle;
    data['aboutNews'] = aboutNews;
    data['newsPhoto'] = newsPhoto;
    return data;
  }
}
