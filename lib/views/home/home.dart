import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          // SizedBox(
          //   height: 400,
          //   child: PageView.builder(
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       return GridView.builder(
          //         gridDelegate: gridDelegate,
          //         itemBuilder: itemBuilder,
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Greatings extends StatelessWidget {
  const Greatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Hi, ',
          style: TextStyle(
            color: Color(0xffE60CFF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Adeola',
          style: TextStyle(
            // color: Color(0xffE60CFF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
