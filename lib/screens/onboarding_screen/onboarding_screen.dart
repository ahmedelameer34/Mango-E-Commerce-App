import 'package:flutter/material.dart';
import 'package:shop_app/helper/cashe_helper.dart';
import 'package:shop_app/screens/login/login_screen.dart';
import 'package:shop_app/shared/components/function.dart';
import 'package:shop_app/shared/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var boardController = PageController();
  bool isLast = false;

  lastOpen() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, LoginScreen());
      }
    });
  }

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/image/10117.jpg',
        title: 'Screen title',
        body: 'Screen body'),
    BoardingModel(
        image: 'assets/image/5247.jpg',
        title: 'Screen title2',
        body: 'Screen body2'),
    BoardingModel(
        image: 'assets/image/4910241.jpg',
        title: 'Screen title3',
        body: 'Screen body3')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  lastOpen();
                },
                child: const Text('Skip',
                    style: TextStyle(fontSize: 20, color: mainColor)))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) =>
                    buildBoardingItem(boarding[index])),
                itemCount: boarding.length,
              )),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: mainColor,
                        dotColor: Colors.grey,
                        spacing: 5,
                        dotWidth: 10,
                        dotHeight: 10,
                        expansionFactor: 4),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    backgroundColor: mainColor,
                    onPressed: () {
                      if (isLast) {
                        lastOpen();
                      } else {
                        boardController.nextPage(
                            duration: const Duration(microseconds: 1400),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image(
                  image: AssetImage(
            model.image,
          ))),
          const SizedBox(
            height: 20,
          ),
          Text(
            model.title,
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            model.body,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      );
}
