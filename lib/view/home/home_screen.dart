
import 'package:aspire_edu/view/home/widgets/carousel_slider.dart';
import 'package:aspire_edu/view/home/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/custom_appbar.dart';
import '../../core/components/custom_scaffold.dart';
import '../../core/constants/data/data.dart';
import 'model/home_model.dart';
import '../stages/stages_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardsModel> cards = [
    CardsModel(
      title: "الدروس",
      image: "assets/images/Lessons.png",
    ),
    CardsModel(
      title: "الكورسات",
      image: "assets/images/Courses.png",
    ),
    CardsModel(
      title: "مشاهير",
      image: "assets/images/famous.png",
    ),
    CardsModel(
      title: "انشطة اخرى",
      image: "assets/images/activity.png",
    ),
  ];
  // List<Widget> screens = [
  //   StagesScreen(),
  //   StagesScreen(),
  //   StagesScreen(),
  //   StagesScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBarCustom: CustomAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "اهلاً بك",
                        style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "انت فى المكان الصحيح ",
                        style: TextStyle(fontSize: 20.sp,),
                      ),
                    ],
                  ),
                ),
                MyCarouselWidget(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 10.h),
                  child: Text(
                    "يمكنك حجز المواد الدراسية او الكورسات المتاحه على المنصة الخاصه بنا من خلال التطبيق",
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "دليلك للوصول والحجز",
                    style: TextStyle(
                     // color: Color(0xFF0D001D),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 30.w,
                  mainAxisSpacing: 20.h,
                  children: List.generate(
                    cards.length,
                    (index) => CustomCard(
                      title: cards[index].title,
                      image: cards[index].image,
                      onTap: () {
                        Navigator.pushNamed(context, stagesScreen);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
