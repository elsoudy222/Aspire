import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors/app_colors.dart';
import '../model/carousel_model.dart';
import 'carousel_slider.dart';

class MyCarouselWidget extends StatefulWidget {

  const MyCarouselWidget({Key? key, }) : super(key: key);

  @override
  State<MyCarouselWidget> createState() => _MyCarouselWidgetState();
}

class _MyCarouselWidgetState extends State<MyCarouselWidget> {
  List<CarouselModel> carouselModel = [
    CarouselModel(
      title: "اللغه الانجليزية",
      profName: "الأستاذه / رحمة مصطفى",
      subtitle:
      "الحجز متاح يومياً من الساعه ٩ صباحاً ل ٩ مساءً في الفرع الرئيسي او من خلال التطبيق.",
      imageUrl: "imageUrl",
    ),
    CarouselModel(
      title: "اللغه الانجليزية",
      profName: "الأستاذه / رحمة مصطفى",
      subtitle:
      "الحجز متاح يومياً من الساعه ٩ صباحاً ل ٩ مساءً في الفرع الرئيسي او من خلال التطبيق.",
      imageUrl: "imageUrl",
    ),
    CarouselModel(
      title: "اللغه الانجليزية",
      profName: "الأستاذه / رحمة مصطفى",
      subtitle:
      "الحجز متاح يومياً من الساعه ٩ صباحاً ل ٩ مساءً في الفرع الرئيسي او من خلال التطبيق.",
      imageUrl: "imageUrl",
    ),
    CarouselModel(
      title: "اللغه الانجليزية",
      profName: "الأستاذه / رحمة مصطفى",
      subtitle:
      "الحجز متاح يومياً من الساعه ٩ صباحاً ل ٩ مساءً في الفرع الرئيسي او من خلال التطبيق.",
      imageUrl: "imageUrl",
    ),
  ];
  int currentIndex = 0;
  Widget indicator(int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: currentIndex == index ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index
              ? AppColors.primaryColor
              : Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
            itemCount: carouselModel.length,
            itemBuilder: (context, index, realIndex) {
              return CarouselBody(
                title: carouselModel[index].title,
                profName:carouselModel[index].profName,
                subtitle: carouselModel[index].subtitle,
              );
            },
            options: CarouselOptions(
              height: 150.h,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            )),
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(carouselModel.length, (index) {
            return indicator(index);
          }),
        )
      ],
    );
  }
}

class CarouselBody extends StatelessWidget {
  const CarouselBody(
      {super.key,
      required this.title,
      required this.profName,
      required this.subtitle,
      this.image});

  final String title;
  final String profName;
  final String subtitle;
  final String? image;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5,),

      height: 130.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    profName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    // width: 120.w,
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: CircleAvatar(
              radius: 40.h,
              // backgroundImage: AssetImage(image),
            ),
          ),
        ],
      ),
    );
  }
}



