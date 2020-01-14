import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';

abstract class ContactDetailState{}

class ContactDetailUninitialized extends ContactDetailState{}

class ContactDetailLoading extends ContactDetailState{}

class ContactDetailLoaded extends ContactDetailState{
  final ContactListItemEntity contactListItemEntity;

  ContactDetailLoaded({
    this.contactListItemEntity
  });
}

class ContactDetailError extends ContactDetailState{
  final String message;

  ContactDetailError({
    this.message
  });
}

