import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preference_cubit_project/services/shared_preference_service.dart';
import 'package:shared_preference_cubit_project/utils/preference_key.dart';

part 'employee_form_state.dart';

class EmployeeFormCubit extends Cubit<EmployeeFormState> {
  EmployeeFormCubit() : super(EmployeeFormInitial());

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

    emit(EmployeeDataAdd());
  }
}
