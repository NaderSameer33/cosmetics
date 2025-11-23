import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/app_image.dart';

import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  final _list = const [
    _Model(
      'edit.svg',
      'Edit Info',
    ),
    _Model(
      'checkOut.svg',
      'Order History',
    ),
    _Model(
      'wallet.svg',
      'wallet',
    ),
    _Model(
      'setting.svg',
      'setting',
    ),
    _Model(
      'vouceer.svg',
      'vouceer',
    ),
    _Model(
      'logout.svg',
      'logOUt',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => _Item(
        model: _list[index],
        index: index,
      ),
    );
  }
}

class _Model {
  final String image, titiel;
  const _Model(this.image, this.titiel);
}

class _Item extends StatelessWidget {
  const _Item({
    required this.model,
    required this.index,
  });
  final _Model model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppImage(
        image: model.image,
      ),
      title: Text(
        model.titiel,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: index == 5 ? const Color(0xffCD0F0F) : const Color(0xff434C6D),
        ),
      ),
      trailing: const AppImage(image: 'arrow.svg'),
    );
  }
}
