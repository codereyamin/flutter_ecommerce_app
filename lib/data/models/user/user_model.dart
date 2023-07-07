class UserModel {
  dynamic sId;
  dynamic fullName;
  dynamic email;
  dynamic phoneNumber;
  dynamic address;
  dynamic city;
  dynamic state;
  dynamic profileProgress;
  dynamic id;
  dynamic updatedOn;
  dynamic createdOn;
  UserModel({
    this.sId,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.address,
    this.city,
    this.state,
    this.profileProgress,
    this.id,
    this.createdOn,
    this.updatedOn,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      sId: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      profileProgress: json['profileProgress'],
      id: json['id'],
      createdOn: json['createOn'],
      updatedOn: json['updateOn'],
    );
  }
}
