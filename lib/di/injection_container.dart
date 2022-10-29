import 'package:get_it/get_it.dart';
import 'package:scrips_task/core/bloc/core_bloc.dart';
import 'package:scrips_task/features/home/data/data_sources/home_local_data_source.dart';
import 'package:scrips_task/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:scrips_task/features/home/data/repositories/home_repository_impl.dart';
import 'package:scrips_task/features/home/domain/repositories/home_repository.dart';
import 'package:scrips_task/features/home/domain/use_cases/home_usecase.dart';
import 'package:scrips_task/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Home

  // bloc
  sl.registerFactory(() => HomeBloc());

  // use cases
  sl.registerLazySingleton(() => HomeUseCase(repository: sl()));

  // repository
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));

  // data sources
  sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl());
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());

  /// Core
  sl.registerFactory(() => CoreBloc());
  /// External
}
