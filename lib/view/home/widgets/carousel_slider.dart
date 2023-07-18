import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
import 'package:aspire_edu/view-model/cubits/home_cubit/home_cubit.dart';
import 'package:aspire_edu/view-model/database/network/end_points.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors/app_colors.dart';
import '../model/carousel_model.dart';
import 'carousel_slider.dart';

class MyCarouselWidget extends StatefulWidget {
  const MyCarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCarouselWidget> createState() => _MyCarouselWidgetState();
}

class _MyCarouselWidgetState extends State<MyCarouselWidget> {
  // List<CarouselModel> carouselModel = [
  //   CarouselModel(
  //     title: "اللغه الانجليزية",
  //     profName: "الأستاذه / رحمة مصطفى",
  //     subtitle:
  //         "الحجز متاح يومياً من الساعه ٩ صباحاً ل ٩ مساءً في الفرع الرئيسي او من خلال التطبيق.",
  //     imageUrl: "imageUrl",
  //   ),
  //   CarouselModel(
  //     title: "اللغه الانجليزية",
  //     profName: "الأستاذه / رحمة مصطفى",
  //     subtitle:
  //         "الحجز متاح يومياً من الساعه ٩ صباحاً ل ٩ مساءً في الفرع الرئيسي او من خلال التطبيق.",
  //     imageUrl: "imageUrl",
  //   ),
  //   CarouselModel(
  //     title: "اللغه الانجليزية",
  //     profName: "الأستاذه / رحمة مصطفى",
  //     subtitle:
  //         "الحجز متاح يومياً من الساعه ٩ صباحاً ل ٩ مساءً في الفرع الرئيسي او من خلال التطبيق.",
  //     imageUrl: "imageUrl",
  //   ),
  //   CarouselModel(
  //     title: "اللغه الانجليزية",
  //     profName: "الأستاذه / رحمة مصطفى",
  //     subtitle:
  //         "الحجز متاح يومياً من الساعه ٩ صباحاً ل ٩ مساءً في الفرع الرئيسي او من خلال التطبيق.",
  //     imageUrl: "imageUrl",
  //   ),
  // ];
  int currentIndex = 0;

  Widget indicator(int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: currentIndex == index ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? AppColors.primaryColor : Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        print(cubit.bannersModel);
        return ConditionalBuilder(
          condition:  cubit.bannersModel.isNotEmpty,
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                  items: cubit.bannersModel
                      .map(
                        (e) => CarouselBody(
                      title: "${e.mainTitle}",
                      profName: "${e.subTitle}",
                      subtitle: "${e.aboutNews}",
                      // TODO :
                          image: "${baseImage}${e.newsPhoto}",
                    ),
                  )
                      .toList(),
                  options: CarouselOptions(
                    height: 150.0.h,

                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  )),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(cubit.bannersModel.length, (index) {
                  return indicator(index);
                }),
              )
            ],
          ),
          fallback: (context) => Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            height: 130.h,
            width: double.infinity,
            decoration: BoxDecoration(
             // color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),

            ),
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        );
      },
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
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
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
                        fontWeight: FontWeight.bold),
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
               backgroundImage: NetworkImage(image!),
            ),
          ),
        ],
      ),
    );
  }
}
