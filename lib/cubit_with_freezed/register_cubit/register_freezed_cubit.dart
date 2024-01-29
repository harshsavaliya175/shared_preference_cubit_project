import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/shared_preference_service.dart';
import '../../utils/preference_key.dart';

part 'register_freezed_cubit.freezed.dart';
part 'register_freezed_state.dart';

class RegisterFreezedCubit extends Cubit<RegisterFreezedState> {
  RegisterFreezedCubit() : super(const RegisterFreezedState.initial()) {
    getEmployeeData();
  }

  void getEmployeeData() {
    emit(const RegisterFreezedState.initial(isLoading: true));
    List employeeDataList = [];

    String employeeDataString =
        PreferenceService.getString(PreferenceKey.employeesDetails);

    if (employeeDataString != '') {
      employeeDataList = jsonDecode(employeeDataString);

      if (employeeDataList.isEmpty) {
        Future.delayed(
          const Duration(seconds: 1),
          () {
            emit(
              state.copyWith(
                isDataNotFound: true,
                isLoading: false,
              ),
            );
          },
        );
      } else {
        Future.delayed(
          const Duration(seconds: 1),
          () {
            emit(
              state.copyWith(
                employeeDataList: employeeDataList,
                isLoading: false,
                isDataNotFound: false,
              ),
            );
          },
        );
      }
    } else {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          emit(
            state.copyWith(
              isDataNotFound: true,
              isLoading: false,
            ),
          );
        },
      );
    }
  }

  void deleteEmployeeRecord(int index) {
    List employeeList = List.from(state.employeeDataList);
    employeeList.removeAt(index);
    PreferenceService.setValue(
      key: PreferenceKey.employeesDetails,
      value: jsonEncode(employeeList),
    );

    emit(
      state.copyWith(
        employeeDataList: employeeList,
        isDeleted: true,
        isDataNotFound: employeeList.isEmpty,
      ),
    );
  }
}
