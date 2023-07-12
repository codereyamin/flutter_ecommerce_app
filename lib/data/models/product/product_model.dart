class ProductModel {
  String? sId;
  String? title;
  String? description;
  String? category;
  int? price;
  List<String>? image;
  String? updateOn;
  String? createdOn;

  ProductModel(
      {this.sId,
      this.title,
      this.description,
      this.category,
      this.price,
      this.image,
      this.updateOn,
      this.createdOn});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    image = json['image'].cast<String>();
    updateOn = json['updateOn'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['price'] = this.price;
    data['image'] = this.image;
    data['updateOn'] = this.updateOn;
    data['createdOn'] = this.createdOn;
    return data;
  }
}
