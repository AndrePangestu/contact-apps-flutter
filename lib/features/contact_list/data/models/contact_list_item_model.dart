import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:meta/meta.dart';

class ContactListItemModel {
  ContactListItemEntity entity;

  ContactListItemModel({
    @required this.entity
  });

  factory ContactListItemModel.fromJson(Map<String, dynamic> json){
    return ContactListItemModel(
      entity: ContactListItemEntity(
        id: json["id"] == null ? null : json["id"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        age: json["age"] == null ? null : json["age"],
        photo: json["photo"] == null ? null : json["photo"],
      )
    );
  }
}