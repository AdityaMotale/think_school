import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages/case_studies.page.dart';
import 'pages/concepts.page.dart';
import 'pages/dashboard.page.dart';
import 'pages/shorts.page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final _bottomNavBarItems = [
    "home_48.svg",
    "play_48.svg",
    "books_48.svg",
    "read_48.svg"
  ];

  final _pages = [
    const DashboardPage(),
    const ShortsPage(),
    const CaseStudiesPage(),
    const ConceptsPage(),
  ];

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: min(MediaQuery.of(context).size.height * 0.09, 72),
          title: const Text(
            "ThinkSchool",
            style: TextStyle(
              fontFamily: "Dm Serif Display",
            ),
          ),
          actions: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFFF3EDFC),
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SvgPicture.network(
                  "https://adityamotale.github.io/think_school_release/public/icons/search_32.svg",
                ),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFFF3EDFC),
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SvgPicture.network(
                  "https://adityamotale.github.io/think_school_release/public/icons/profile_32.svg",
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(
              color: const Color(0xFFE2DEFD),
              height: 2,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  _selectedIndex = value;

                  setState(() {});
                },
                controller: _pageController,
                itemCount: _pages.length,
                itemBuilder: (_, index) {
                  return _pages[index];
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Color(0xFFE2DEFD),
                width: 2,
              ),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.09,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < _bottomNavBarItems.length; i++)
                InkWell(
                  onTap: () {
                    _selectedIndex = i;
                    _pageController.jumpToPage(_selectedIndex);
                    setState(() {});
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: i == _selectedIndex
                          ? const Color(0xFF8B93FF)
                          : const Color(0xFFF3EDFC),
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SvgPicture.network(
                        "https://adityamotale.github.io/think_school_release/public/icons/${_bottomNavBarItems[i]}",
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
