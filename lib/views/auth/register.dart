import 'dart:developer';

import 'package:bjayedu/routers/route_export.dart';
import 'package:bjayedu/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/providers.dart';
import '../../widgets/button.dart';
import '../../widgets/divider.dart';
import '../../widgets/rich_text.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});
  static const route = '/signup';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _usernameController,
      _emailController,
      _passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void tryRegister({
    required String username,
    required String email,
    required String password,
  }) async {
    FocusScope.of(context).unfocus();
    final bool? isFormValid = _formKey.currentState?.validate();
    if (isFormValid != null && isFormValid) {
      log('register pressed');
      await ref.read(authProvider).register(
            email: email,
            password: password,
            username: username,
          );
      log('register...kk');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * .45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/signup.png',
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Positioned(
              // top: 0,
              child: Container(
                // height: size.height * .45,
                color: const Color(0xffE60CFF).withOpacity(.3),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * .6,
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Create account',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _usernameController,
                        name: 'Username',
                        hintText: 'Quamdeen Victoria',
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: _emailController,
                        name: 'E-mail',
                        hintText: 'Quamdeenvictoria@gmail.com',
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        controller: _passwordController,
                        name: 'Password',
                        isObscureText: true,
                      ),
                      const SizedBox(height: 15),
                      AppElevatedButton(
                        onPressed: () => tryRegister(
                          username: _usernameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        ),
                        text: 'Sign up',
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppDivider(),
                          SizedBox(width: 20),
                          Text(
                            'Sign up with',
                            style: TextStyle(
                              color: Color(0xffA9A9A9),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 20),
                          AppDivider(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.facebook_rounded),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.facebook_rounded),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.apple_outlined),
                          ),
                        ],
                      ),
                      AppRichText(
                        onTap: () => context.go(LoginView.route),
                        baseText: 'Already have an account? ',
                        subText: 'Sign in.',
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
