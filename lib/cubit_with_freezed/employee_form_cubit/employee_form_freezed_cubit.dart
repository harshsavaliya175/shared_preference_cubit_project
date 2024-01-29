import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/shared_preference_service.dart';
import '../../utils/preference_key.dart';

part 'employee_form_freezed_cubit.freezed.dart';
part 'employee_form_freezed_state.dart';

class EmployeeFormFreezedCubit extends Cubit<EmployeeFormFreezedState> {
  EmployeeFormFreezedCubit() : super(const EmployeeFormFreezedState.initial());

  Future<bool> addAndEditEmployeeDetails({
    required String name,
    required String joiningDate,
    required String phoneNumber,
    int? id,
  }) async {
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

      if (id != null) {
        employeeDataList[id] = employeeDetailsMap;
      } else {
        employeeDataList.add(employeeDetailsMap);
      }
    } else {
      employeeDataList.add(employeeDetailsMap);
    }

    bool isDone = await PreferenceService.setValue(
      key: PreferenceKey.employeesDetails,
      value: jsonEncode(employeeDataList),
    );

    return isDone;
  }
}
