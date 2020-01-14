import 'package:contact_apps_flutter/features/contact_list/data/models/contact_list_item_model.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:meta/meta.dart';

class ContactListModel {
  String message;
  List<ContactListItemModel> data;

  ContactListModel({this.message, this.data});

  ContactListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = new List<ContactListItemModel>();
      json['data'].forEach((v) {
        data.add(new ContactListItemModel.fromJson(v));
      });
    }
  }

}

class Data {
  String id;
  String firstName;
  String lastName;
  int age;
  String photo;

  Data({this.id, this.firstName, this.lastName, this.age, this.photo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['age'] = this.age;
    data['photo'] = this.photo;
    return data;
  }
}

