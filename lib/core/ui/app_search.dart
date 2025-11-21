import 'app_input.dart';
import 'package:flutter/material.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppInput(
      suffixIcon: 'search.svg',
      hintText: 'search',
    );
  }
}
