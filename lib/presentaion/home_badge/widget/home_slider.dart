import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/lists/images_list.dart';
import '../cubit/cubit.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key,required this.cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    final List imageList = ImagesList.caverImages;
    return LayoutBuilder(
        builder: (context, constraints) {
        return Center(
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height:constraints.maxWidth <= 1200? 200: height * 0.5479452054794521,  // Same height ratio
              autoPlay: true,                      // Enables auto-scrolling
              enlargeCenterPage: true,             // Enlarges the center image
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
            ),
            itemCount: imageList.length,  // Total number of items
            itemBuilder: (BuildContext context, int index, int realIndex) {
              cubit.slideManger(index);
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageList[index]),  // Access image via index
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }
}

