import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myweather/Features/pick%20location/domain/repositries/pick_location_repo.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/singleton/shared_prefrence_singleton.dart';

part 'pick_location_state.dart';

class PickLocationCubit extends Cubit<PickLocationState> {
  PickLocationCubit(this.pickLocation) : super(PickLocationInitial());

  final PickLocationRepo pickLocation;

  void getLocation() async {
    emit(PickLocationLoading());

    var result = await pickLocation.getLocation();
    result.fold((l) {
      emit(PickLocationFailure(l.errMessage));
    }, (r) {
      Prefs.prefs.setString(kCityName, r);
      emit(PickLocationSuccess(cityName: r));
    });
  }
}
