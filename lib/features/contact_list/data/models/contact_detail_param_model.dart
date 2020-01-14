class ContactDetailParam {
  String firstName;
  String lastName;
  int age;
  String photo;

  ContactDetailParam({this.firstName, this.lastName, this.age, this.photo});

  ContactDetailParam.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['age'] = this.age;
    data['photo'] = this.photo;
    return data;
  }
}