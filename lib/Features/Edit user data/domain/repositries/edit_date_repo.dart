import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myweather/core/Error/failures.dart';

abstract class EditDataRepo {
  Future<Either<Failure, void>> editUserData(
      {String? cityName, String? userName, String? email, String? password});

  User fetchUser();
}
