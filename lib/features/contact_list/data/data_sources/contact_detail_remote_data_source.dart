import 'dart:convert';

import 'package:contact_apps_flutter/core/error/exceptions.dart';
import 'package:contact_apps_flutter/features/contact_list/data/models/contact_detail_model.dart';
import 'package:contact_apps_flutter/features/contact_list/data/models/contact_list_item_model.dart';
import 'package:contact_apps_flutter/features/contact_list/data/models/contact_list_model.dart';
import 'package:contact_apps_flutter/features/contact_list/data/data_sources/contact_list_data_source.dart';
import 'package:contact_apps_flutter/features/contact_list/data/models/response_message_model.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/entities/response_message_entity.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class ContactDetailDataSource {
  Future<ContactDetailModel> getContactDetail(String contactId);
  Future<ResponseMessageModel> addContactDetail(String firstName,
      String lastName,
      int age,
      String photo);

}

class ContactDetailRemoteDataSource implements ContactDetailDataSource {
  final Dio client;

  ContactDetailRemoteDataSource({@required this.client});

  @override
  Future<ContactDetailModel> getContactDetail(String contactId) =>
      _getContactDetailFromUrl('https://simple-contact-crud.herokuapp.com/contact/$contactId');

  @override
  Future<ResponseMessageModel> addContactDetail(
      String firstName,
      String lastName,
      int age,
      String photo,
      ) =>
      _addContactDetailFromUrl(
          'https://simple-contact-crud.herokuapp.com/contact',
        firstName, lastName, age, photo
      );

  Future<ContactDetailModel> _getContactDetailFromUrl(String url) async {
    final response = await client.get(
        url,
        options: Options(
            contentType: 'application/json'
        )
    );

    print('resultDetail ${response.data}');

    if (response.statusCode == 200) {
      return ContactDetailModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  Future<ResponseMessageModel> _addContactDetailFromUrl(
      String url, String firstName, String lastName, int age, String photo
      ) async {
    final response = await client.post(
        url,
        options: Options(
            contentType: 'application/json'
        ),
        data: {
          "firstName" : firstName,
          "lastName" : lastName,
          "age" : age,
          "photo" : photo
        }
    );

    if (response.statusCode == 201) {
      return ResponseMessageModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}