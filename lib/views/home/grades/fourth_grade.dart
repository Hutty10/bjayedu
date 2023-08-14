import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FourthGrade extends ConsumerWidget {
  const FourthGrade({super.key});
  static const String route = 'fourth-grade';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * .4,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 20, top: 50),
                  alignment: AlignmentDirectional.topEnd,
                  decoration: const BoxDecoration(
                    color: Color(0xffE60CFF),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  child: Image.asset('assets/images/avatar.png'),
                ),
                Positioned(
                  top: 110.h,
                  // left: .w,
                  child: Image.asset(
                    'assets/images/4th_grade.png',
                    fit: BoxFit.fitWidth,
                    width: size.width,
                  ),
                ),
                Positioned(
                  left: size.width * .05,
                  bottom: -90.h,
                  child: Card(
                    elevation: 4,
                    child: Container(
                      height: 178.h,
                      width: size.width * .9,
                      alignment: AlignmentDirectional.topCenter,
                      padding: EdgeInsets.only(top: 20.h),
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        '4th  Grade',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 100.h),
          Expanded(
            // height: size.height * .45,
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (_, index) {
                const List<String> content = [
                  'Course',
                  'Quiz',
                  'Library',
                  'Score'
                ];
                return Container(
                  // height: 101.h,
                  // width: 154.w,
                  alignment: AlignmentDirectional.bottomStart,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    content[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
