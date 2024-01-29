part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class DataNotFound extends RegisterState {}

class GetEmployeeData extends RegisterState {
  List employeeDataList = [];
  GetEmployeeData({required this.employeeDataList});
}
