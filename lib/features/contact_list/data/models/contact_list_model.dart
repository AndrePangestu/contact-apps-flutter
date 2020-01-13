import 'package:contact_apps_flutter/features/contact_list/data/models/contact_list_item_model.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:meta/meta.dart';

class ContactListModel {
  String message;
  List<ContactListItemModel> data;

  ContactListModel({this.message, this.data});

  ContactListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['ContactListItemModel'] != null) {
      data = new List<ContactListItemModel>();
      json['ContactListItemModel'].forEach((v) {
        data.add(new ContactListItemModel.fromJson(v));
      });
    }
  }

}

