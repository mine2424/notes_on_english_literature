import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/widgets/button/radius_button.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carouselController = CarouselController();

    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Wellcome to NOEL!',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 24),
              padding: const EdgeInsets.all(20),
              child: CarouselSlider(
                items: [
                  Image.network(
                    'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-dsc/events/photo_2021-02-25_21-49-51.jpg',
                  ),
                  Image.network(
                    'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-dsc/events/photo_2021-02-25_21-49-51.jpg',
                  ),
                  Image.network(
                    'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-dsc/events/photo_2021-02-25_21-49-51.jpg',
                  ),
                ],
                carouselController: carouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 3000),
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  aspectRatio: 6 / 5,
                ),
              ),
            ),
            const SizedBox(height: 64),
            RadiusButton(
              onTapLogic: () {},
              text: 'そのまま進む',
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 20, color: Colors.blue[400]),
            ).show(context),
            RadiusButton(
              onTapLogic: () {},
              text: 'データを引き継ぐ',
              textStyle:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
            ).show(context),
          ],
        ),
      ),
    );
  }
}
