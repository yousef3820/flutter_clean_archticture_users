import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/presentation/cubits/cubit/get_user_cubit.dart';

class GetUserButton extends StatelessWidget {
  final int userId;

  const GetUserButton({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<GetUserCubit>().eitherGetUserOrFailure(userId);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      ),
      child: const Text(
        "Get user",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
