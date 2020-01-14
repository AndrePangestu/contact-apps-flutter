import 'package:contact_apps_flutter/features/contact_list/data/models/contact_list_item_model.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:meta/meta.dart';

import 'contact_detail_item_model.dart';

class ContactDetailModel {
  String message;
  ContactDetailItemModel data;

  ContactDetailModel({this.message, this.data});

  ContactDetailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new ContactDetailItemModel.fromJson(json['data']) : null;
  }

}

