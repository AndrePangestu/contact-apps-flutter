import 'package:contact_apps_flutter/features/contact_list/data/models/contact_list_model.dart';

abstract class ContactListDataSource {
  Future<ContactListModel> getContactList();
}