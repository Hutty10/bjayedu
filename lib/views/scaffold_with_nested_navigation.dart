// import 'package:bjayedu/views/home/home.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// import 'profile/profile.dart';

// class ButtomNav extends ConsumerStatefulWidget {
//   ButtomNav({super.key, required String tab}) : index = indexFrom(tab);
//   final int index;

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _ButtomNavState();
//   static int indexFrom(String tab) {
//     switch (tab) {
//       case 'home':
//         return 0;
//       case 'notification':
//         return 1;
//       case 'search':
//         return 2;
//       case 'profile':
//         return 3;
//       default:
//         return 0;
//     }
//   }
// }

// class _ButtomNavState extends ConsumerState<ButtomNav> {
//   late int _selectedIndex;
//   @override
//   void initState() {
//     super.initState();
//     _selectedIndex = widget.index;
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _selectedIndex = widget.index;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: FocusScope.of(context).unfocus,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: IndexedStack(
//           index: _selectedIndex,
//           children: [
//             const HomeView(),
//             Container(color: Colors.green),
//             Container(color: Colors.orange),
//             const ProfileView(),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           onTap: (index) {
//             if (_selectedIndex != 0 && index == 0) {
//               setState(() {
//                 _selectedIndex = 0;
//               });
//               context.go(HomeView.route);
//             } else if (_selectedIndex != 1 && index == 1) {
//               setState(() {
//                 _selectedIndex = 1;
//               });
//               // context.go(HomeView.route);
//             } else if (_selectedIndex != 2 && index == 2) {
//               setState(() {
//                 _selectedIndex = 2;
//               });
//               // context.go(ProfileView.route);
//             } else if (_selectedIndex != 3 && index == 3) {
//               setState(() {
//                 _selectedIndex = 3;
//               });
//               context.go(ProfileView.route);
//             }
//           },
//           currentIndex: _selectedIndex,
//           // selectedItemColor: theme.primaryColor,
//           // unselectedItemColor: theme.colorScheme.onSurface,
//           type: BottomNavigationBarType.fixed,
//           landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
//           iconSize: 30,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,

//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined),
//               label: 'Home',
//               tooltip: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.notifications_outlined),
//               label: 'notifications',
//               tooltip: 'notifications',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search_outlined),
//               label: 'search',
//               tooltip: 'search',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person_outline),
//               label: 'Profile',
//               tooltip: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        elevation: 0,
        backgroundColor: Colors.white,
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
          ),
          NavigationDestination(
            label: 'Home',
            icon: Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
          ),
          NavigationDestination(
            label: 'Home',
            icon: Icon(
              Icons.search_outlined,
              size: 30,
            ),
          ),
          NavigationDestination(
            label: 'Home',
            icon: Icon(
              Icons.person_outline,
              size: 30,
            ),
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
