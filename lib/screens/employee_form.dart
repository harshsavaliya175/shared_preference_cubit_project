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

    final Map? editEmployee =
        ModalRoute.of(context)!.settings.arguments as Map?;

    //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    TextEditingController nameController = TextEditingController();
    TextEditingController joiningDateController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    DateTime dateTime = DateTime.now();

    if (editEmployee != null) {
      nameController.text = editEmployee['name'];
      joiningDateController.text = editEmployee['joiningDate'];
      phoneController.text = editEmployee['phoneNumber'];
      if (editEmployee['joiningDate'] != '') {
        dateTime = DateTime.parse(editEmployee['joiningDate']);
      }
    }

    Future<void> showDatePickerFunction() async {
      if (joiningDateController.text != '') {
        dateTime = DateTime.parse(joiningDateController.text);
      }
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: dateTime,
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
      body: BlocBuilder<EmployeeFormFreezedCubit, EmployeeFormFreezedState>(
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
                              RegExp("[a-zA-Z ]"),
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
                          maxLength: 10,
                        ),
                        heightSizeBox(30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              bool check = editEmployee == null
                                  ? await employeeFormCubit
                                      .addAndEditEmployeeDetails(
                                      name: nameController.text,
                                      joiningDate: joiningDateController.text,
                                      phoneNumber: phoneController.text,
                                    )
                                  : await employeeFormCubit
                                      .addAndEditEmployeeDetails(
                                      name: nameController.text,
                                      joiningDate: joiningDateController.text,
                                      phoneNumber: phoneController.text,
                                      id: editEmployee['id'],
                                    );

                              if (check) {
                                if (!context.mounted) return;
                                Navigator.of(context).pop();
                              } else {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Employee Details Not Add'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            child:
                                Text(editEmployee == null ? 'Submit' : 'Edit'),
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
