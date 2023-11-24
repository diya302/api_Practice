import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final controller = PageController();
  bool isLastPage = false;
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 4;
                  });
                },
                children: [
                  Container(
                      child: Center(
                          child: Text(
                        'Page 1',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                      color: Colors.red),
                  Container(
                      child: Center(
                          child: Text(
                        'Page 2',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                      color: Colors.indigo),
                  Container(
                      child: Center(
                          child: Text(
                        'Page 3',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                      color: Colors.green),
                  Container(
                      child: Center(
                          child: Text(
                        'Page 4',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                      color: Colors.blueGrey),
                  Container(
                      child: Center(
                          child: Text(
                        'Page 5',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                      color: Colors.yellow),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: isLastPage
                ? TextButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnBoard(),
                          ));
                    },
                    child: Text('Get Started'),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            controller.jumpToPage(4);
                          },
                          child: Text('SKIP')),
                      Center(
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 5,
                          effect: WormEffect(
                              spacing: 16,
                              dotColor: Colors.black,
                              activeDotColor: Colors.teal),
                          onDotClicked: (index) => controller.animateToPage(
                              index,
                              duration: Duration(microseconds: 500),
                              curve: Curves.easeIn),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            print('Next');
                            controller.nextPage(
                                duration: Duration(microseconds: 500),
                                curve: Curves.easeInOut);
                          },
                          child: Text('NEXT')),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
