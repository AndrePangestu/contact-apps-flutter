import 'package:contact_apps_flutter/core/error/failures.dart';
import 'package:contact_apps_flutter/core/network/network_info.dart';
import 'package:contact_apps_flutter/features/contact_list/data/data_sources/contact_detail_remote_data_source.dart';
import 'package:contact_apps_flutter/features/contact_list/data/data_sources/contact_list_remote_data_source.dart';
import 'package:contact_apps_flutter/features/contact_list/data/models/contact_detail_item_model.dart';
import 'package:contact_apps_flutter/features/contact_list/data/models/contact_detail_model.dart';
import 'package:contact_apps_flutter/features/contact_list/data/models/contact_list_item_model.dart';
import 'package:contact_apps_flutter/features/contact_list/data/models/contact_list_model.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/repositories/contact_detail_repository.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/repositories/contact_list_repository.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:contact_apps_flutter/core/error/exceptions.dart';

class ContactDetailRepositoryImpl implements ContactDetailRepository {
  final ContactDetailDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ContactDetailRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo
  });

  @override
  Future<Either<Failure, ContactListItemEntity>> getContactDetail(
      String contactId
      ) async {
    if (await networkInfo.isConnected) {
      try {
        ContactDetailModel result = await remoteDataSource.getContactDetail(contactId);
        ContactListItemEntity listData = result.data.entity;
        return Right(listData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

}