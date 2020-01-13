import 'package:contact_apps_flutter/core/error/failures.dart';
import 'package:contact_apps_flutter/core/usecases/usecase.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/usecases/get_contact_list.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_event.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'dart:async';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState>{
  final GetContactList getContactList;

  ContactListBloc({
    this.getContactList
  });

  @override
  ContactListState get initialState => ContactListUninitialized();

  @override
  Stream<ContactListState> mapEventToState(ContactListEvent event) async* {
    if(event is FetchContactList){
      yield ContactListLoading();
//      final failureOrSuccess = await getContactList(NoParams());
      Either<Failure, List<ContactListItemEntity>> result = await getContactList(NoParams());
//      print('data ${failureOrSuccess}');
//      yield* _eitherLoadedOrErrorState(result);
    }
  }

  Stream<ContactListState> _eitherLoadedOrErrorState(
      Either<Failure, List<ContactListItemEntity>> failureOrSuccess,
      ) async* {
    yield failureOrSuccess.fold(
          (failure) => ContactListError(message: _mapFailureToMessage(failure)),
          (contactList) => ContactListLoaded(contactListItemEntity: contactList),
    );
  }

  String _mapFailureToMessage(Failure failure) {
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