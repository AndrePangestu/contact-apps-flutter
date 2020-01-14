import 'package:contact_apps_flutter/core/network/network_info.dart';
import 'package:contact_apps_flutter/features/app_main/presentation/bloc/bloc.dart';
import 'package:contact_apps_flutter/features/contact_list/data/data_sources/contact_list_remote_data_source.dart';
import 'package:contact_apps_flutter/features/contact_list/data/repositories/contact_list_repository_impl.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/repositories/contact_list_repository.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/usecases/get_contact_list.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
      () => BottomNavigationBloc(),
  );
  sl.registerFactory(
      () => ContactListBloc(
        contactList: sl()
      ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetContactList(sl()));

  // Repository
  sl.registerLazySingleton<ContactListRepository>(
      () => ContactListRepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl()
      ),
  );

  // Data sources
  sl.registerLazySingleton<ContactListDataSource>(
      () => ContactListRemoteDataSource(
        client: sl()
      )
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());

}