import '../../../core/logic/helper_methods.dart';
import '../login.dart';
import '../../home/view.dart';

import '../../../core/ui/app_button.dart';
import '../../../core/ui/app_image.dart';
import 'package:flutter/material.dart';

class SucessDialog extends StatelessWidget {
  const SucessDialog({super.key, this.isComeSignUp = false});

  final bool isComeSignUp;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      backgroundColor: const Color(0xffD9D9D9),
      children: [
        const AppImage(
          image: 'success.json',
          height: 70,
          width: 70,
        ),
        const SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          isComeSignUp ? 'Account Activated!' : 'Password Created!',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          textAlign: TextAlign.center,
          isComeSignUp
              ? 'Congratulations! Your account \n  has been successfully activated'
              : 'Congratulations! Your password\n  has been successfully created',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: const Color(0xff434C6D).withValues(alpha: .8),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        AppButton(
          title: isComeSignUp ? 'Go to Home' : 'Return to login',
          onPressed: () => goTo(
            isComeSignUp ? const HomeView() : const LoginView(),
            canPop: false,
          ),
        ),
      ],
    );
  }
}
