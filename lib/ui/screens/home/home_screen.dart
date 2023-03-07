import 'package:flutter/material.dart';
import 'package:movie_train/models/home_page.dart';
import 'package:movie_train/ui/screens/home/all_motion_pictures_page.dart';
import 'package:movie_train/ui/screens/home/favorites_page.dart';
import 'package:movie_train/ui/screens/home/hidden_motion_pictures_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int _currentPageIndex = 1;
  List<HomePage> pages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (pages.isEmpty) {
      pages = const [
        HomePage(
          screen: AllMotionPicturesPage(),
          bottomNavigationBarItem: BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'all',
          ),
        ),
        HomePage(
          screen: FavoritesPage(),
          bottomNavigationBarItem: BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'favortites',
          ),
        ),
        HomePage(
          screen: HiddenMotionPicturesPage(),
          bottomNavigationBarItem: BottomNavigationBarItem(
            icon: Icon(Icons.hide_image),
            label: 'hidden',
          ),
        ),
      ];
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: _changePage,
              children: pages.map((page) => page.screen).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: pages.map((page) => page.bottomNavigationBarItem).toList(),
        onTap: _changePage,
      ),
    );
  }

  void _changePage(int page) {
    if (_currentPageIndex == page) {
      return;
    }
    setState(() {
      _currentPageIndex = page;
    });
    pageController.jumpToPage(page);
  }
}
