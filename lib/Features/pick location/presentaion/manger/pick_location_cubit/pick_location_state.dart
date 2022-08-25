part of 'pick_location_cubit.dart';

abstract class PickLocationState extends Equatable {
  const PickLocationState();

  @override
  List<Object> get props => [];
}

class PickLocationInitial extends PickLocationState {}

class PickLocationLoading extends PickLocationState {}

class PickLocationFailure extends PickLocationState {
  final String errMessage;

  PickLocationFailure(this.errMessage);
}

class PickLocationSuccess extends PickLocationState {}
