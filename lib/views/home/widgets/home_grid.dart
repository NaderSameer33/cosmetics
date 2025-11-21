import '../../../core/ui/app_image.dart';
import 'package:flutter/material.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  final _list = const [
    _Modle(
      'https://img.joomcdn.net/307c7497a72f45db4cd241c998ca272a6efa670e_original.jpeg',
      '\$44.99',
      'Face tint / lip tint',
    ),
    _Modle(
      'https://images.satu.kz/186949256_w200_h200_athe-authentic-lip.jpg',
      '\$44.99',
      'Face tint / lip tint',
    ),
    _Modle(
      'https://img.joomcdn.net/687cd9796995bdd7fe40ed1b0e618c317c4ed3e0_original.jpeg',
      '\$44.99',
      'Athe Red lipstick',
    ),
    _Modle(
      'https://img.joomcdn.net/307c7497a72f45db4cd241c998ca272a6efa670e_original.jpeg',

      '\$44.99',
      'Athe Red lipstick',
    ),
    _Modle(
      'https://img.joomcdn.net/4a52958221ed2fe708ee1b196daf26ade9d73742_original.jpeg',
      '\$44.99',
      'Face tint / lip tint',
    ),
    _Modle(
      'https://img.joomcdn.net/307c7497a72f45db4cd241c998ca272a6efa670e_original.jpeg',
      '\$44.99',
      'Athe Red lipstick',
    ),
    _Modle(
      'https://img.joomcdn.net/307c7497a72f45db4cd241c998ca272a6efa670e_original.jpeg',

      '\$44.99',
      'Athe Red lipstick',
    ),
    _Modle(
      'https://images.satu.kz/186949256_w200_h200_athe-authentic-lip.jpg',
      '\$44.99',
      'Face tint / lip tint',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 100),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        
        childAspectRatio: 176 / 237,
      ),
      shrinkWrap: true,
        
      itemCount: _list.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _Item(
          prodcutModel: _list[index],
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.prodcutModel});
  final _Modle prodcutModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffD9D9D9),
        boxShadow: [
          const BoxShadow(
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 1),
            blurStyle: BlurStyle.inner,
            color: Colors.black,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: AppImage(
                  fit: BoxFit.cover,
                  image: prodcutModel.image,
                  width: double.infinity,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 6, top: 6),
                padding: const EdgeInsets.all(8),
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: const AppImage(
                  image: 'home_card.svg',
                  height: 16,
                  width: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            prodcutModel.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,

              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            prodcutModel.price,
            style: const TextStyle(
              color: Color(0xff70839C),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _Modle {
  final String image, title, price;
  const _Modle(this.image, this.price, this.title);
}
