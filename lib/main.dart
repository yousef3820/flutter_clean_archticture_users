import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_archticture_myself_2/core/service_locator.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/presentation/cubits/cubit/get_user_cubit.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/presentation/screens/user_screen.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserCubit(),
      child: MaterialApp(
        home: const UserScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
