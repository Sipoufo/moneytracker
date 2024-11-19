import 'package:flutter/material.dart';

class OnboardingController {
  int currentPageIndex = 0;
  PageController pageController = PageController();

  // Update current index when page scroll
  void updatePageIndicator (index) {
    currentPageIndex = index;
  }

  // Jum to the specific dot selected page
  void dotNavigationClick (index) {
    currentPageIndex = index;
    pageController.jumpToPage(index);
  }

  // Update current index & jump to next page
  void nextPage () {
    if (currentPageIndex == 2) {

    } else {
      int page = currentPageIndex + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update current index & jump to last page
  void skipPage () {
    currentPageIndex = 2;
    pageController.jumpToPage(2);
  }
}
