import 'dart:async';

import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();
void goTo(Widget page, {bool canPop = true, int? delayedSeconds}) {
  void action() {
    Navigator.pushAndRemoveUntil(
      navKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
      (route) => canPop,
    );
  }

  if (delayedSeconds != null) {
    Timer(Duration(seconds: delayedSeconds), () {
      action();
    });
  } else {
    action();
  }
}

void showMsg(String text, {bool isError = false}) {
  if (text.isNotEmpty) {
    ScaffoldMessenger.of(
      navKey.currentContext!,
    ).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
        content: Text(text),
      ),
    );
  }
}
