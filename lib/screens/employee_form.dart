import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preference_cubit_project/common/height_size_box.dart';
import 'package:shared_preference_cubit_project/common/text_filed.dart';
import 'package:shared_preference_cubit_project/cubit_with_freezed/employee_form_cubit/employee_form_freezed_cubit.dart';

class EmployeeForm extends StatelessWidget {
  const EmployeeForm({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeeFormFreezedCubit employeeFormCubit =
        BlocProvider.of<EmployeeFormFreezedCubit>(context);

    TextEditingController nameController = TextEditingController();
    TextEditingController joiningDateController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    Future<void> showDatePickerFunction() async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime.now(),
      );

      if (pickedDate != null) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
        joiningDateController.text = formattedDate;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Form'),
      ),
      body: BlocConsumer<EmployeeFormFreezedCubit, EmployeeFormFreezedState>(
        listener: (BuildContext context, EmployeeFormFreezedState state) {
          Navigator.of(context).pop();
        },
        builder: (BuildContext context, EmployeeFormFreezedState state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: BlocBuilder<EmployeeFormFreezedCubit,
                    EmployeeFormFreezedState>(
                  builder:
                      (BuildContext context, EmployeeFormFreezedState state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonTextFiled(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z]"),
                            ),
                          ],
                          textFiledText: 'Name',
                          hintText: 'Enter Name',
                          prefixIcon: Icons.person,
                        ),
                        heightSizeBox(20),
                        commonTextFiled(
                          controller: joiningDateController,
                          textFiledText: 'Joining Date',
                          hintText: 'Choose Date',
                          prefixIcon: Icons.date_range,
                          readOnly: true,
                          onTap: () {
                            showDatePickerFunction();
                          },
                        ),
                        heightSizeBox(20),
                        commonTextFiled(
                          controller: phoneController,
                          textFiledText: 'Mobile Number',
                          hintText: 'Enter Number',
                          prefixIcon: Icons.mobile_friendly,
                          keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        heightSizeBox(30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              employeeFormCubit.addEmployeeDetails(
                                name: nameController.text,
                                joiningDate: joiningDateController.text,
                                phoneNumber: phoneController.text,
                              );
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
