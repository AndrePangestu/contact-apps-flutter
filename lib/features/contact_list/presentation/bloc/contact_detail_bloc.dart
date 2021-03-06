import 'dart:math';

import 'package:contact_apps_flutter/core/error/failures.dart';
import 'package:contact_apps_flutter/core/usecases/usecase.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/usecases/get_contact_detail.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/usecases/add_contact_detail.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/usecases/get_contact_list.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_event.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'dart:async';

import 'contact_detail_event.dart';
import 'contact_detail_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class ContactDetailBloc extends Bloc<ContactDetailEvent, ContactDetailState>{
  final GetContactDetail getContactDetail;
  final AddContactDetailUseCase addContactDetail;

  ContactDetailBloc({
    @required GetContactDetail contactDetail,
    @required AddContactDetailUseCase addContact,
  }) : assert(contactDetail != null),
        assert(addContact != null),
        getContactDetail = contactDetail,
        addContactDetail = addContact;

  @override
  ContactDetailState get initialState => ContactDetailUninitialized();

  @override
  Stream<ContactDetailState> mapEventToState(ContactDetailEvent event) async* {
    if(event is FetchContactDetail){
      yield ContactDetailLoading();
      final failureOrSuccess = await getContactDetail(Params(contactId: event.contactId));
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
    }

    if(event is PostContactDetail){
      yield ContactDetailLoading();
      final failureOrSuccess = await addContactDetail(ParamsAdd(
        firstName: event.firstName,
        lastName: event.lastName,
        age: event.age,
        photo: event.photo
      ));
      print('failureOrSuccess ${failureOrSuccess}');
      yield* _eitherLoadedOrErrorStateCrud(failureOrSuccess);
    }
  }

  Stream<ContactDetailState> _eitherLoadedOrErrorState(
      Either<Failure, ContactListItemEntity> failureOrSuccess,
      ) async* {
    yield failureOrSuccess.fold(
          (failure) => ContactDetailError(message: _mapFailureToMessage(failure)),
          (contactList) => ContactDetailLoaded(contactListItemEntity: contactList),
    );
  }

  Stream<ContactDetailState> _eitherLoadedOrErrorStateCrud(
      Either<Failure, String> failureOrSuccess,
      ) async* {
    yield failureOrSuccess.fold(
          (failure) => ContactDetailCrudError(message: _mapFailureToMessage(failure)),
          (message) => ContactDetailCrudLoaded(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    print('error ${failure}');
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }


}