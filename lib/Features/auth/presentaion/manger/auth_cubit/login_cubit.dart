import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositries/auth_repo.dart';

part 'login_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;


  void loginUser({required String email, required String password}) async {
    emit(LoginLoading());

    var result = await authRepo.login(email: email, password: password);
    result.fold((l) {
      emit(LoginFailure(l.errMessage));
    }, (r) {
      emit(LoginSuccess());
    });
  }

  void register(
      {required String email,
      required String password,
      required String userName}) async {
    emit(RegisterLoading());

    var result = await authRepo.register(
        email: email, password: password, userName: userName);
    result.fold((l) {
      emit(RegisterFailure(l.errMessage));
    }, (r) {
      emit(RegisterSuccess());
    });
  }
}
