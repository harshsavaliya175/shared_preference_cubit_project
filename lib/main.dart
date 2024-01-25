import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preference_cubit_project/cubit_with_freezed/employee_form_cubit/employee_form_freezed_cubit.dart';
import 'package:shared_preference_cubit_project/cubit_with_freezed/register_cubit/register_freezed_cubit.dart';
import 'package:shared_preference_cubit_project/screens/employee_form.dart';
import 'package:shared_preference_cubit_project/screens/register_screen.dart';
import 'package:shared_preference_cubit_project/services/shared_preference_service.dart';
import 'package:shared_preference_cubit_project/utils/route_names.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceService.inIt();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<RegisterFreezedCubit>(
          create: (BuildContext context) => RegisterFreezedCubit(),
        ),
        BlocProvider<EmployeeFormFreezedCubit>(
          create: (BuildContext context) => EmployeeFormFreezedCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialRoute: RouteNames.registerScreen,
      routes: {
        RouteNames.registerScreen: (context) => const RegisterScreen(),
        RouteNames.employeeForm: (context) => const EmployeeForm(),
      },
    );
  }
}
