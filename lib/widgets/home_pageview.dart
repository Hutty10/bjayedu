import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_grade_card.dart';

class PageViewWithIndicator extends ConsumerStatefulWidget {
  const PageViewWithIndicator({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PageViewWithIndicatorState();
}

class _PageViewWithIndicatorState extends ConsumerState<PageViewWithIndicator> {
  int _currentPage = 0;
  late PageController _pageController;
  final int _totalPages = 3;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _totalPages,
            itemBuilder: (_, index) {
              return Indicator(active: _currentPage == index);
            },
            separatorBuilder: (_, __) => const SizedBox(width: 8),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 420,
          child: PageView(
            // itemCount: _totalPages,
            onPageChanged: (value) => setState(
              () {
                _currentPage = value;
              },
            ),
            children: const [
              GradwCards(
                children: [
                  HomeGradCard(
                    color: Color(0xffFFACAC),
                    image: 'assets/images/1st.png',
                    grade: '1st',
                  ),
                  HomeGradCard(
                    color: Color(0xff00FF66),
                    image: 'assets/images/2nd.png',
                    grade: '2nd',
                  ),
                  HomeGradCard(
                    color: Color(0xffFFE040),
                    image: 'assets/images/3rd.png',
                    grade: '3rd',
                  ),
                ],
              ),
              GradwCards(
                children: [
                  HomeGradCard(
                    color: Color(0xffE60CFF),
                    image: 'assets/images/4th.png',
                    grade: '4th',
                  ),
                  HomeGradCard(
                    color: Color(0xff75FFF7),
                    image: 'assets/images/5th.png',
                    grade: '4th',
                  ),
                  HomeGradCard(
                    color: Color(0xff90A56E),
                    image: 'assets/images/6th.png',
                    grade: '6th',
                  ),
                ],
              ),
              GradwCards(
                children: [
                  HomeGradCard(
                    color: Color(0xffFF007A),
                    image: 'assets/images/7th.png',
                    grade: '7th',
                  ),
                  HomeGradCard(
                    color: Color(0xffA975FF),
                    image: 'assets/images/8th.png',
                    grade: '8th',
                  ),
                  HomeGradCard(
                    color: Color(0xffA8FF1A),
                    image: 'assets/images/9th.png',
                    grade: '9th',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    this.active = false,
  });
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: active ? const Color(0xffE60CFF) : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class GradwCards extends StatelessWidget {
  const GradwCards({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            children[0],
            children[1],
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            children[2],
          ],
        )
      ],
    );
  }
}
