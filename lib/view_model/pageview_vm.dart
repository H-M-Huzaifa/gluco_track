import 'package:flutter/cupertino.dart';

class PageviewVm with ChangeNotifier{



  final PageController _pageController = PageController();
  int _currentPage = 0;

  int get currentPage => _currentPage;

  PageController get pageController => _pageController;

  void nextPage() {
    if (_currentPage < 7) {
      _currentPage++;
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }
}

