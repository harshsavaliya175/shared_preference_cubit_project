// import 'dart:convert';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preference_cubit_project/services/shared_preference_service.dart';
// import 'package:shared_preference_cubit_project/utils/preference_key.dart';
//
// part 'register_state.dart';
//
// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterInitial()) {
//     getEmployeeData();
//   }
//
//   void getEmployeeData() {
//     List employeeDataList = [];
//
//     String employeeDataString =
//         PreferenceService.getString(PreferenceKey.employeesDetails);
//
//     if (employeeDataString != '') {
//       employeeDataList = jsonDecode(employeeDataString);
//
//       if (employeeDataList.isEmpty) {
//         emit(DataNotFound());
//       } else {
//         emit(GetEmployeeData(employeeDataList: employeeDataList));
//       }
//     } else {
//       emit(DataNotFound());
//     }
//   }
// }
