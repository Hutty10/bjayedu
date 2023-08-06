import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});
  static const String route = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
        children: [
          Image.asset(
            'assets/images/profile_view.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
