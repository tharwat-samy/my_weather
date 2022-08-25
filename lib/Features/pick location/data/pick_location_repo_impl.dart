import 'package:dartz/dartz.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myweather/Features/home/domain/models/weather_model/location.dart';
import 'package:myweather/Features/pick%20location/domain/repositries/pick_location_repo.dart';
import 'package:myweather/core/Error/exceptions.dart';
import 'package:myweather/core/Error/failures.dart';

class PickLocationRepoImpl implements PickLocationRepo {
  @override
  Future<Either<Failure, String>> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled) {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        return left(
          ServerFailure('Permission denied'),
        );
      } else if (permission == LocationPermission.deniedForever) {
        return left(
          ServerFailure('Permission denied for ever '),
        );
      } else {
        Position position = await Geolocator.getCurrentPosition();

        var cityName = await  DecodeLocation(position: position);
        return right(cityName);
      }
    } else {
      return left(
        ServerFailure('something went wrong! try again'),
      );
    }
  }

  @override
  Future<String> DecodeLocation({required Position position}) async {
    try {
      var address = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(position.latitude, position.longitude),
      );

      return address.first.countryName;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
