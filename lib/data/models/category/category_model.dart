class CategoryModel {
  String? sId;
  String? title;
  String? description;
  String? createOn;

  CategoryModel({this.sId, this.title, this.description, this.createOn});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    createOn = json['createOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['createOn'] = this.createOn;
    return data;
  }
}
