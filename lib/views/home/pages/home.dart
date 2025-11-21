import '../../../core/ui/app_search.dart';

import '../../../core/ui/app_image.dart';
import '../widgets/home_grid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const AppSearch(),

            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const AppImage(
                    image: 'home_makup.png',
                    height: 320,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffE9DCD3).withValues(alpha: .8),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '50% OFF DISCOUNT \n CUPON CODE : 125865',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff62322D),
                                ),
                              ),
                            ),
                            AppImage(
                              image: 'offer.svg',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AppImage(image: 'offer.svg'),
                            Spacer(),
                            Text(
                              'Hurry up! \n Skin care only !',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              'Top rated products',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const HomeGridView(),
          ],
        ),
      ),
    );
  }
}
