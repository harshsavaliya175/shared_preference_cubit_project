import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preference_cubit_project/common/width_size_box.dart';
import 'package:shared_preference_cubit_project/cubit_with_freezed/register_cubit/register_freezed_cubit.dart';
import 'package:shared_preference_cubit_project/utils/route_names.dart';

import '../common/height_size_box.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterFreezedCubit registerFreezedCubit =
        BlocProvider.of<RegisterFreezedCubit>(context);

    void addEmployeeTap() {
      Navigator.of(context).pushNamed(RouteNames.employeeForm).then(
        (dynamic value) {
          registerFreezedCubit.getEmployeeData();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Register ( Records )'),
      ),
      body: BlocBuilder<RegisterFreezedCubit, RegisterFreezedState>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (BuildContext context, RegisterFreezedState state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(height: double.infinity, width: double.infinity),
              if (state.employeeDataList.isNotEmpty)
                ListView.builder(
                  itemCount: state.employeeDataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              employeeDetails(
                                icon: Icons.perm_contact_cal_outlined,
                                title:
                                    '${(state.employeeDataList[index]['name']).toUpperCase()}',
                              ),
                              heightSizeBox(5),
                              employeeDetails(
                                icon: Icons.date_range_outlined,
                                title: state.employeeDataList[index]
                                    ['joiningDate'],
                              ),
                              heightSizeBox(5),
                              employeeDetails(
                                icon: Icons.mobile_friendly,
                                title:
                                    '${(state.employeeDataList[index]['phoneNumber'])}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              if (state.isDataNotFound) const Text('Empty Data'),
              if (state.isLoading)
                Container(
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: const CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addEmployeeTap();
        },
        backgroundColor: Colors.deepPurple,
        label: const Text('New Employee'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

Widget employeeDetails({required IconData icon, required String title}) {
  return Row(
    children: [
      Icon(icon),
      widthSizeBox(8),
      Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    ],
  );
}
