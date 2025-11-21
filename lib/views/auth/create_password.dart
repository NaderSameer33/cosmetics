import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';
import 'widgets/sucees_dialog.dart';
import 'package:flutter/material.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppImage(
                image: 'splash_logo_two.png',
                height: 50,
              ),
              const SizedBox(height: 40),
              const Text(
                textAlign: TextAlign.center,
                'create password',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),
              const Text(
                textAlign: TextAlign.center,
                'The password should have at least \n 6 characters.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff8E8EA9),
                ),
              ),
              const SizedBox(height: 40),
              const AppInput(
                isSuffix: true,
                hintText: 'new password',
                label: 'new password',
              ),
              const SizedBox(
                height: 10,
              ),
              const AppInput(
                isSuffix: true,
                hintText: 'confirm password',
                label: 'confirm password',
              ),
              const SizedBox(
                height: 40,
              ),
              AppButton(
                title: 'Confirm',
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const SucessDialog(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
