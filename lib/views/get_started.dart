import 'package:bjayedu/routers/route_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});
  static const route = '/get-started';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.fromSize(
            size: size,
            child: Image.asset(
              'assets/images/getstarted.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: const Color(0xffE60CFF).withOpacity(.3),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Start and learn\ntoday.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  ref.read(getStartedProvider.notifier).state = true;
                  // context.go(LoginView.route);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffE60CFF),
                  //  minimumSize: const Size(64),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

final getStartedProvider = StateProvider<bool>((ref) => false);
