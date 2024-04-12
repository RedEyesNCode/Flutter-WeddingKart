import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wedding_kart/src/view/widgets/ImageCard.dart';

class AutoScrollImageCardCarousel extends StatefulWidget {
  final List<ImageCard> imageCards;
  final Duration autoScrollDuration;

  AutoScrollImageCardCarousel({
    required this.imageCards,
    this.autoScrollDuration = const Duration(seconds: 3), // Default duration is 3 seconds
  });

  @override
  _AutoScrollImageCardCarouselState createState() => _AutoScrollImageCardCarouselState();
}

class _AutoScrollImageCardCarouselState extends State<AutoScrollImageCardCarousel> {
  late PageController _pageController;
  late int _currentPageIndex;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
    _pageController = PageController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (_currentPageIndex < widget.imageCards.length - 1) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(milliseconds: 500), // Adjust animation duration as needed
        curve: Curves.easeInOut, // Adjust animation curve as needed
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Adjust height as needed
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.imageCards.length,
        itemBuilder: (context, index) {
          return widget.imageCards[index];
        },
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }
}
