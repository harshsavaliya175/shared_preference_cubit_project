part of 'employee_form_freezed_cubit.dart';

@freezed
class EmployeeFormFreezedState with _$EmployeeFormFreezedState {
  const factory EmployeeFormFreezedState.initial({
    @Default(false) bool isValidate,
  }) = _Initial;
}
