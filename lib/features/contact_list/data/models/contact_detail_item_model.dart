import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:meta/meta.dart';

class ContactDetailItemModel {
  ContactListItemEntity entity;

  ContactDetailItemModel({
    @required this.entity
  });

  factory ContactDetailItemModel.fromJson(Map<String, dynamic> json){
    return ContactDetailItemModel(
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