import 'package:flutter/material.dart';
import 'package:valoinfos/constants/style.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  bool isActive = false;

  @override
  void initState() {
    _pageController = PageController(keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Style.pagePadding,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  itemCount: 4,
                  onPageChanged: (int value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/skye.webp'),
                      ],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    4,
                    (index) {
                      return AnimatedContainer(
                        margin: const EdgeInsets.only(right: 4),
                        height: 4,
                        width: index == _pageIndex ? 12 : 4,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                        ),
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                  ),
                  const Spacer(),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 500),
                    crossFadeState: _pageIndex == 3 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    firstChild: const SizedBox.shrink(),
                    secondChild: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeInQuad);
                      },
                      child: const Text('göster'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
