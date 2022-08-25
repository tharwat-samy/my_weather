import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myweather/Features/Edit%20user%20data/domain/repositries/edit_date_repo.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/Error/failures.dart';
import 'package:myweather/core/singleton/shared_prefrence_singleton.dart';
import 'package:myweather/core/utils/firebase_service.dart';

class EditDataRepoImpl extends EditDataRepo {
  final FirebaseService firebaseService;

  EditDataRepoImpl(this.firebaseService);

  @override
  Future<Either<Failure, void>> editUserData(
      {String? cityName,
      String? userName,
      String? email,
      String? password}) async {
    try {
      if (userName != null) {
        await firebaseService.updateUserNmae(name: userName);
      }
      if (password != null) {
        await firebaseService.updatePassword(password: password);
      }
      if (email != null) {
        await firebaseService.updateEmail(email: email);
      }

      if (cityName != null) {
        await Prefs.prefs.setString(kCityName, cityName);
      }
      return right(null);
    } catch (e) {
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  User fetchUser() {
    return firebaseService.getUser();
  }
}
