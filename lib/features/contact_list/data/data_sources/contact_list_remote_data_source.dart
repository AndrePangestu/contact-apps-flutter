import 'dart:convert';

import 'package:contact_apps_flutter/core/error/exceptions.dart';
import 'package:contact_apps_flutter/features/contact_list/data/models/contact_list_item_model.dart';
import 'package:contact_apps_flutter/features/contact_list/data/models/contact_list_model.dart';
import 'package:contact_apps_flutter/features/contact_list/data/data_sources/contact_list_data_source.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class ContactListDataSource {
  Future<ContactListModel> getContactList();
}

class ContactListRemoteDataSource implements ContactListDataSource {
  final Dio client;

  ContactListRemoteDataSource({@required this.client});

  @override
  Future<ContactListModel> getContactList() =>
      _getContactListFromUrl('https://simple-contact-crud.herokuapp.com/contact');

  Future<ContactListModel> _getContactListFromUrl(String url) async {
    final response = await client.get(
      url,
      options: Options(
        contentType: 'application/json'
      )
    );

    print('result ${response.data}');

    if (response.statusCode == 200) {
      return ContactListModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}