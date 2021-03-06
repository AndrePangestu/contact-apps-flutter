import 'package:contact_apps_flutter/core/error/failures.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ContactListRepository {
  Future<Either<Failure, List<ContactListItemEntity>>> getContactList();
}