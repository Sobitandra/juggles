import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 30),
            height: double.maxFinite,
            color: Colors.black,
            padding: const EdgeInsets.only(top: 30),
            child: const Text(
              "Title",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 32),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 34,
            child: CustomPaint(
              painter: AppBarCustomPaint(),
              child: Obx(() => Text(
                    controller.currentTime.value.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://bsmedia.business-standard.com/_media/bs/im"
              "g/article/2021-09/16/full/1631766502-0839.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: List.generate(
                        controller.icons.length,
                        (index) => Material(
                              color: Colors.transparent,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    controller.icons[index],
                                    size: 30,
                                    color: Colors.white,
                                  )),
                            )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.only(top: 10),
                    height: 70,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                controller.leftUser.value++;
                              },
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // Here using transform and stack to make cuts at corner
                                  Positioned(
                                      top: -25,
                                      right: -25,
                                      child: Transform.rotate(
                                        angle: pi / 4,
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          color: Colors.red,
                                        ),
                                      ))
                                ],
                              ),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.black,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Obx(() => Text(
                                            controller.leftUser.value
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                  const FittedBox(
                                    child: Text(
                                      "Juggles",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Expanded(
                                      child: Obx(() => Text(
                                            controller.rightUser.value
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                ],
                              ),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                controller.rightUser.value++;
                              },
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // Here using transform and stack to make cuts at corner
                                  Positioned(
                                      top: -25,
                                      left: -25,
                                      child: Transform.rotate(
                                        angle: pi / 4,
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          color: Colors.red,
                                        ),
                                      ))
                                ],
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: BottomCustomPaint(),
              ),
            ),
            buildMyNavBar()
          ],
        ),
      ),
    );
  }

  buildMyNavBar() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 6),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          bottomButtons(),
          bottomButtons(),
          const Flexible(
            flex: 2,
            child: SizedBox(),
          ),
          bottomButtons(),
          bottomButtons(),
        ],
      ),
    );
  }

  Flexible bottomButtons() {
    return Flexible(
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * .42, 0);
    path0.lineTo(size.width * .5, size.height * .48);
    path0.lineTo(size.width * .58, 0);
    path0.lineTo(size.width, 0);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AppBarCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    Path path0 = Path();
    path0.lineTo(size.width * .3, 0);
    path0.lineTo(size.width * .38, size.height);
    path0.lineTo(size.width * .62, size.height);
    path0.lineTo(size.width * .7, 0);

    Paint paint1 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    Path path1 = Path();
    // Line is starting from -width as in horizontal view its getting
    // padding from both left and right and don't know why.
    path1.lineTo(-size.width, 0);
    path1.lineTo(size.width * .3, 0);
    path1.lineTo(size.width * .38, size.height);
    path1.lineTo(size.width * .62, size.height);
    path1.lineTo(size.width * .7, 0);
    path1.lineTo(size.width * 2, 0);

    canvas.drawPath(path0, paint0);
    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
