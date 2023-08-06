import 'package:bjayedu/routers/route_export.dart';
import 'package:bjayedu/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/button.dart';
import '../../widgets/divider.dart';
import '../../widgets/rich_text.dart';

class Register extends ConsumerWidget {
  const Register({super.key});
  static const route = '/signup';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    const CustomTextField(
                      name: 'Username',
                      hintText: 'Quamdeen Victoria',
                    ),
                    const SizedBox(height: 15),
                    const CustomTextField(
                      name: 'E-mail',
                      hintText: 'Quamdeenvictoria@gmail.com',
                    ),
                    const SizedBox(height: 15),
                    const CustomTextField(
                      name: 'Password',
                      isObscureText: true,
                    ),
                    const SizedBox(height: 15),
                    AppElevatedButton(
                      onPressed: () => context.go(HomeView.route),
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
            )
          ],
        ),
      ),
    );
  }
}
