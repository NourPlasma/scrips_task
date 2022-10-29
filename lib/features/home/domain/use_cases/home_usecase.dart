import 'package:dartz/dartz.dart';
import 'package:scrips_task/core/error/failures.dart';
import 'package:scrips_task/core/use_cases/use_case.dart';
import 'package:scrips_task/features/home/domain/entities/home_entity.dart';
import 'package:scrips_task/features/home/domain/repositories/home_repository.dart';


class HomeUseCase implements UseCase<HomeEntity,NoParams>{
  final HomeRepository repository;

  HomeUseCase({required this.repository});
  @override
  Future<Either<Failure, HomeEntity>> call(params) {

    throw UnimplementedError();
  }

}