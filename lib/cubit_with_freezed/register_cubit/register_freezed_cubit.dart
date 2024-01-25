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
          const Duration(seconds: 3),
          () {
            emit(
              const RegisterFreezedState.initial(
                isDataNotFound: true,
                isLoading: false,
              ),
            );
          },
        );
      } else {
        emit(
          RegisterFreezedState.initial(
            employeeDataList: employeeDataList,
            isLoading: false,
            isDataNotFound: false,
          ),
        );
      }
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          emit(
            const RegisterFreezedState.initial(
              isDataNotFound: true,
              isLoading: false,
            ),
          );
        },
      );
    }
  }
}
