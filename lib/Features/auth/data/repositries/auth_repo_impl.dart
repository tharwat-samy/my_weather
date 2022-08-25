import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myweather/Features/auth/domain/repositries/auth_repo.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/Error/exceptions.dart';
import 'package:myweather/core/Error/failures.dart';
import 'package:myweather/core/utils/firebase_service.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseService firebaseService;

  AuthRepoImpl(this.firebaseService);
  @override
  Future<Either<Failure, void>> login(
      {required String email, required String password}) async {
    try {
      await firebaseService.login(password: password, email: email);

      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(ServerFailure('User Not Found'));
      } else if (e.code == 'wrong-password') {
        return left(ServerFailure('Wrong Password'));
      } else {
        return left(ServerFailure('something went wrong please try later'));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> register(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      await firebaseService.register(
          password: password, email: email, userName: userName);
      await updateUserName(userName: userName);
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(ServerFailure('Weak Password'));
      } else if (e.code == 'email-already-in-use') {
        return left(ServerFailure('Email already in use'));
      } else {
        return left(ServerFailure('something went wrong please try later'));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, void>> storeUserIfno(
  //     {required String userName, required String email}) async {
  //   try {
  //     await firebaseService.storeData(
  //         Collection: kUserCollection,
  //         body: {
  //           kUserName: userName,
  //           kEmail: email,
  //         },
  //         email: email);

  //     return right(null);
  //   } catch (e) {
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, void>> updateUserName(
      {required String userName}) async {
    try {
      await firebaseService.updateUserNmae(name: userName);
      return right(null);
    } catch (e) {
      throw ServerException('problem with storing user name');
    }
  }
}
