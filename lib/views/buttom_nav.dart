import 'package:bjayedu/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth.dart';

class ButtomNav extends ConsumerStatefulWidget {
  ButtomNav({super.key, required String tab}) : index = indexFrom(tab);
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButtomNavState();
  static int indexFrom(String tab) {
    switch (tab) {
      case 'home':
        return 0;
      case 'notification':
        return 1;
      case 'search':
        return 2;
      case 'account':
        return 3;
      default:
        return 0;
    }
  }
}

class _ButtomNavState extends ConsumerState<ButtomNav> {
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomeView(),
          Container(color: Colors.green),
          Container(color: Colors.orange),
          Container(color: Colors.black),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (_selectedIndex != 0 && index == 0) {
            context.go(HomeView.route);
          }
          // } else if (_selectedIndex != 1 && index == 1) {
          //   context.go(RoutePath.explore);
          // } else if (_selectedIndex != 2 && index == 2) {
          //   context.go(RoutePath.cart);
          // } else if (_selectedIndex != 3 && index == 3) {
          //   context.go(RoutePath.offer);
          // } else if (_selectedIndex != 4 && index == 4) {
          //   context.go(RoutePath.account);
          // }
        },
        currentIndex: _selectedIndex,
        // selectedItemColor: theme.primaryColor,
        // unselectedItemColor: theme.colorScheme.onSurface,
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        iconSize: 30,
        showSelectedLabels: true,
        showUnselectedLabels: true,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'notifications',
            tooltip: 'notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'search',
            tooltip: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
            tooltip: 'Account',
          ),
        ],
      ),
    );
  }
}
