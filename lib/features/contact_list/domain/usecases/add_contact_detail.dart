import 'package:contact_apps_flutter/features/contact_list/domain/repositories/contact_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:contact_apps_flutter/core/error/failures.dart';
import 'package:contact_apps_flutter/core/usecases/usecase.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/repositories/contact_list_repository.dart';

class AddContactDetailUseCase implements UseCase<String, ParamsAdd>{
  final ContactDetailRepository repository;

  AddContactDetailUseCase(
      this.repository
  );

  @override
  Future<Either<Failure, String>> call(ParamsAdd params) async {
    return await repository.addContactDetail(
      params.firstName,
      params.lastName,
      params.age,
      params.photo
    );
  }
}

class ParamsAdd extends Equatable {
  final String firstName;
  final String lastName;
  final int age;
  final String photo;

  ParamsAdd({
    this.firstName,
    this.lastName,
    this.age,
    this.photo
  });

  @override
  List<Object> get props => [firstName, lastName, age, photo];
}