import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/shared_preference_service.dart';
import '../../utils/preference_key.dart';

part 'employee_form_freezed_cubit.freezed.dart';
part 'employee_form_freezed_state.dart';

class EmployeeFormFreezedCubit extends Cubit<EmployeeFormFreezedState> {
  EmployeeFormFreezedCubit() : super(const EmployeeFormFreezedState.initial());

  void addEmployeeDetails({
    required String name,
    required String joiningDate,
    required String phoneNumber,
  }) {
    List employeeDataList = [];

    String employeeDataString =
        PreferenceService.getString(PreferenceKey.employeesDetails);

    Map employeeDetailsMap = {
      'name': name,
      'joiningDate': joiningDate,
      'phoneNumber': phoneNumber,
    };

    if (employeeDataString != '') {
      employeeDataList = jsonDecode(employeeDataString);
      employeeDataList.add(employeeDetailsMap);
    } else {
      employeeDataList.add(employeeDetailsMap);
    }

    PreferenceService.setValue(
      key: PreferenceKey.employeesDetails,
      value: jsonEncode(employeeDataList),
    );

    emit(const EmployeeFormFreezedState.initial());
  }
}
