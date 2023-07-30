import 'package:bjayedu/views/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/app_textfield.dart';
import '../../widgets/rich_text.dart';
import '../../widgets/sign_in_up_button.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});
  static const route = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: const Color(0xffE60CFF),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppRichText(
                        onTap: () => context.go(SignUp.route),
                        baseText: 'Don’t have an account? ',
                        subText: 'Sign up.',
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SignInUpButton(
                              onPressed: () => context.go(SignUp.route),
                              text: 'Sign Up',
                              isSignIn: false),
                          SignInUpButton(onPressed: () {}, text: 'Sign In'),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
            ),
            const Positioned(
              top: 520,
              right: 10,
              child: CustomTextField(
                name: 'E-mail',
              ),
            ),
            const Positioned(
              top: 620,
              child: CustomTextField(
                name: 'Password',
              ),
            )
          ],
        ),
      ),
    );
  }
}
