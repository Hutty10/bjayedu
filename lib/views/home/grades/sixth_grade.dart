import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SixthGrade extends ConsumerWidget {
  const SixthGrade({super.key});
  static const String route = 'sixth-grade';

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
                    color: Color(0xff90A56E),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  child: Image.asset('assets/images/avatar.png'),
                ),
                Positioned(
                  top: 50.h,
                  left: 20.w,
                  child: Image.asset('assets/images/6th_grade.png'),
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
                        '6th  Grade',
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
