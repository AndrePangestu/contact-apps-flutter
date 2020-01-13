import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:contact_apps_flutter/core/error/failures.dart';
import 'package:contact_apps_flutter/core/usecases/usecase.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/repositories/contact_list_repository.dart';

class GetContactList implements UseCase<List<ContactListItemEntity>, NoParams>{
  final ContactListRepository repository;

  GetContactList(
    this.repository
  );

  @override
  Future<Either<Failure, List<ContactListItemEntity>>> call(NoParams param) async {
    return await repository.getContactList();
  }
}