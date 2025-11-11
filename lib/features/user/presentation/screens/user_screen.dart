import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/presentation/cubits/cubit/get_user_cubit.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/presentation/widgets/get_user_button.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/presentation/widgets/landing_widget.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/presentation/widgets/slider.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/presentation/widgets/user_details.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  double currentValue = 1;
  @override
  void initState() {
    super.initState();
    context.read<GetUserCubit>().eitherGetUserOrFailure(1);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserCubit, GetUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        Widget content;
        if (state is GetUserLoading) {
          // 🟡 Loading state while fetching user
          content = const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetUserSuccess) {
          // 🟢 Success state when user data is loaded
          content = SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const LandingWidget(),
                const SizedBox(height: 20),
                UserDetails(icon: Icons.person, details: state.user.name),
                UserDetails(icon: Icons.mail, details: state.user.email),
                UserDetails(icon: Icons.phone, details: state.user.phone),
                UserDetails(
                  icon: Icons.home,
                  details: state.user.address.street,
                ),
                const SizedBox(height: 40),
                Text(
                  'Select another user:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                SliderWidget(
                  currentValue: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                GetUserButton(userId: currentValue.toInt()),
                const SizedBox(height: 40),
              ],
            ),
          );
        } else if (state is GetUserFailure) {
          // 🔴 Failure state when API call fails
          content = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error: ${state.errorMessage}',
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
              const SizedBox(height: 30),
              SliderWidget(
                currentValue: currentValue,
                onChanged: (value) {
                  setState(() {
                    currentValue = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              GetUserButton(userId: currentValue.toInt()),
            ],
          );
        } else {
          // Fallback (shouldn’t happen)
          content = const Center(child: Text('Unknown state'));
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: content),
          ),
        );
      },
    );
  }
}
