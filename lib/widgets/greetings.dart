import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/providers.dart';

class Greatings extends StatelessWidget {
  const Greatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Hi, ',
          style: TextStyle(
            color: Color(0xffE60CFF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Consumer(
          builder: (context, ref, _) {
            final username = ref.watch(usernameProvider);
            return username.when(
              data: (value) => Text(
                value,
                style: const TextStyle(
                  // color: Color(0xffE60CFF),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              error: (_, __) => const Text('...'),
              loading: () => const CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }
}
