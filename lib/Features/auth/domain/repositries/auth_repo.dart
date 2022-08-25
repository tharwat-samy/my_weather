import 'package:dartz/dartz.dart';
import 'package:myweather/core/Error/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> login(
      {required String email, required String password});

  Future<Either<Failure, void>> register(
      {required String userName,
      required String email,
      required String password});

  Future<Either<Failure, void>> updateUserName({
    required String userName,
  });

}
