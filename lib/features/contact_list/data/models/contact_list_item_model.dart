import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:meta/meta.dart';

class ContactListItemModel {
  ContactListItemEntity entity;

  ContactListItemModel({
    @required this.entity
  });

  factory ContactListItemModel.fromJson(Map<String, dynamic> json){
    return ContactListItemModel(
      entity: ContactListItemEntity()
    );
  }
}