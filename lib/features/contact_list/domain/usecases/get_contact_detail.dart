import 'package:contact_apps_flutter/features/contact_list/domain/repositories/contact_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:contact_apps_flutter/core/error/failures.dart';
import 'package:contact_apps_flutter/core/usecases/usecase.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/repositories/contact_list_repository.dart';

class GetContactDetail implements UseCase<ContactListItemEntity, Params>{
  final ContactDetailRepository repository;

  GetContactDetail(
      this.repository
  );

  @override
  Future<Either<Failure, ContactListItemEntity>> call(Params params) async {
    return await repository.getContactDetail(params.contactId);
  }
}

class Params extends Equatable {
  final String contactId;

  Params({@required this.contactId});

  @override
  List<Object> get props => [contactId];
}