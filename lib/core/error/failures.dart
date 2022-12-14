import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([properties = const <dynamic>[]]);
}

// General failures
class ServerFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

