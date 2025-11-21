import '../../../core/ui/app_image.dart';
import 'cart_button.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  final _list = const [
    _Model(
      'https://i.pinimg.com/736x/b2/bd/a7/b2bda7c7d655da647c403505c48c8744.jpg',
      '100 EGP',
      'Ultra rich mascara for lashes',
      'Note Cosmetics',
    ),
    _Model(
      'https://d1flfk77wl2xk4.cloudfront.net/Assets/38/067/XXL_p0189906738.jpg',
      '200 EGP',
      'Ultra rich mascara for lashes',
      'Note Cosmetics',
    ),

    _Model(
      'https://i.pinimg.com/736x/b2/bd/a7/b2bda7c7d655da647c403505c48c8744.jpg',
      '300 EGP',
      'Ultra rich mascara for lashes',
      'Note Cosmetics',
    ),
    _Model(
      'https://d1flfk77wl2xk4.cloudfront.net/Assets/38/067/XXL_p0189906738.jpg',
      '400 EGP',
      'Ultra rich mascara for lashes',
      'Note Cosmetics',
    ),
    _Model(
      'https://i.pinimg.com/736x/b2/bd/a7/b2bda7c7d655da647c403505c48c8744.jpg',
      '500 EGP',
      'Ultra rich mascara for lashes',
      'Note Cosmetics',
    ),
    _Model(
      'https://d1flfk77wl2xk4.cloudfront.net/Assets/38/067/XXL_p0189906738.jpg',
      '600 EGP',
      'Ultra rich mascara for lashes',
      'Note Cosmetics',
    ),
    _Model(
      'https://i.pinimg.com/736x/b2/bd/a7/b2bda7c7d655da647c403505c48c8744.jpg',
      '700 EGP',
      'Ultra rich mascara for lashes',
      'Note Cosmetics',
    ),
    _Model(
      'https://d1flfk77wl2xk4.cloudfront.net/Assets/38/067/XXL_p0189906738.jpg',
      '800 EGP',
      'Ultra rich mascara for lashes',
      'Note Cosmetics',
    ),
    _Model(
      'https://i.pinimg.com/736x/b2/bd/a7/b2bda7c7d655da647c403505c48c8744.jpg',
      '900 EGP',
      'Ultra rich mascara for lashes',
      'Note Cosmetics',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 100),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => _Item(
        model: _list[index],
      ),

      separatorBuilder: (context, index) => const Divider(
        color: Color(0xffB3B3C1),
        endIndent: 20,
        indent: 20,
      ),

      itemCount: _list.length,
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.model,
  });
  final _Model model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AppImage(
                image: model.image,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const AppImage(
                image: 'out.svg',
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                TextSpan(
                  text: "${model.title}\n",

                  children: [
                    TextSpan(
                      text: "${model.subTitle}\n",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: model.price,
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: AlignmentDirectional.centerEnd,
                child: CartButton(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Model {
  final String title, subTitle, price, image;
  const _Model(this.image, this.price, this.subTitle, this.title);
}
