import 'dart:developer' show log;

import 'package:bjayedu/views/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/auth.dart';
import '../../widgets/app_textfield.dart';
import '../../widgets/rich_text.dart';
import '../../widgets/sign_in_up_button.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});
  static const route = '/login';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController, _passwordController;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _tryLogin(BuildContext context,
      {required String email, required String password}) async{
    FocusScope.of(context).unfocus();
    final bool? isFormValid = _formKey.currentState?.validate();
    if (isFormValid != null && isFormValid) {
      log('login pressed');
      await ref.read(authProvider).login(email: email, password: password);
      log('logining...kk');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SignInUpButton(
                          onPressed: () => context.go(Register.route),
                          text: 'Sign Up',
                          isSignIn: false),
                      SignInUpButton(
                        onPressed: () => _tryLogin(
                          context,
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        ),
                        text: 'Sign In',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
              // height: ,
            ),
            Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 520),
                children: [
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'adeolavictoria@gmail.com',
                    name: 'E-mail',
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    name: 'Password',
                    isObscureText: true,
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: AppRichText(
                      onTap: () => context.go(Register.route),
                      baseText: 'Don’t have an account? ',
                      subText: 'Sign up.',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
