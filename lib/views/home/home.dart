import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/providers.dart';
import '../../widgets/greetings.dart';
import '../../widgets/home_pageview.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  static const route = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: ref.read(authProvider).logout,
            iconSize: 30,
            icon: const Icon(Icons.menu),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const Greatings(),
            const SizedBox(height: 20),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 260.w,
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 65,
                    decoration: BoxDecoration(
                      color: const Color(0xffE60CFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose your grade',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            const PageViewWithIndicator()
          ],
        ),
      ),
    );
  }
}
