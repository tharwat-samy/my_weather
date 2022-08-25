import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myweather/Features/Edit%20user%20data/domain/repositries/edit_date_repo.dart';

part 'edit_data_state.dart';

class EditDataCubit extends Cubit<EditDataState> {
  EditDataCubit(this.editDataRepo) : super(EditDataInitial());

  final EditDataRepo editDataRepo;
  void UpdateData(
      {String? email,
      String? password,
      String? location,
      String? userName}) async {
    emit(EditDataLoading());

    var result = await editDataRepo.editUserData(
        email: email,
        cityName: location,
        password: password,
        userName: userName);
    result.fold((l) {
      emit(EditDataFailure(l.errMessage));
    }, (r) {
      emit(EditDataSuccess());
    });
  }

  get User => editDataRepo.fetchUser();
}
