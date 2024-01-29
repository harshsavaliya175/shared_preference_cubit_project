part of 'register_freezed_cubit.dart';

@freezed
class RegisterFreezedState with _$RegisterFreezedState {
  const factory RegisterFreezedState.initial({
    @Default([]) List employeeDataList,
    @Default(false) bool isLoading,
    @Default(false) bool isDataNotFound,
    @Default(false) bool isDeleted,
  }) = _Initial;
}
