import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';

abstract class ContactListState{}

class ContactListUninitialized extends ContactListState{}

class ContactListLoading extends ContactListState{}

class ContactListLoaded extends ContactListState{
  final List<ContactListItemEntity> contactListItemEntity;

  ContactListLoaded({
    this.contactListItemEntity
  });
}

class ContactListError extends ContactListState{
  final String message;

  ContactListError({
    this.message
  });
}

