import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/greetings.dart';
import '../../widgets/home_pageview.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  static const route = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const Greatings(),
          const SizedBox(height: 20),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 50,
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration.collapsed(hintText: null),
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
    );
  }
}
