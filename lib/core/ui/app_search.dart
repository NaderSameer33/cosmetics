import 'package:flutter/material.dart';

import 'app_input.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppInput(
      isSearch: true,
      suffixIcon: 'search.svg',
      hintText: 'search',
    );
  }
}
