
import 'package:scrips_task/features/home/data/data_sources/home_local_data_source.dart';
import 'package:scrips_task/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:scrips_task/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});
}
