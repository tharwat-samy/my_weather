part of 'edit_data_cubit.dart';

abstract class EditDataState extends Equatable {
  const EditDataState();

  @override
  List<Object> get props => [];
}

class EditDataInitial extends EditDataState {}

class EditDataLoading extends EditDataState {}

class EditDataSuccess extends EditDataState {}

class EditDataFailure extends EditDataState {
  final String errMessage;

  EditDataFailure(this.errMessage);
}
