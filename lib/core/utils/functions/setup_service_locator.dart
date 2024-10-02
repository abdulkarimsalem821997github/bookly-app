import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/home/data/data_sources/home_local_data_source.dart';
import '../../../Features/home/data/data_sources/home_remote_data_source.dart';
import '../../../Features/home/data/reopse/home_repose_impl.dart';
import '../api_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<ApiService>(ApiService(Dio()));
  sl.registerSingleton<HomeReposeImpl>(HomeReposeImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(sl.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImp()));
}
