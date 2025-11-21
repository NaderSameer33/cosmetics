import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_resent_otp.dart';
import 'login.dart';
import 'widgets/sucees_dialog.dart';

import '../../core/logic/helper_methods.dart';
import 'create_password.dart';
import '../../core/ui/app_verfiy_code.dart';
import '../../core/ui/app_button.dart';
import 'package:flutter/material.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key, this.isComeSignUp = false});
  final bool isComeSignUp;

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
                image: 'login_logo.png',
                height: 227,
                width: 284,
              ),
              const SizedBox(height: 24),
              const Text(
                textAlign: TextAlign.center,
                'Verify Code',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(
                style: TextStyle(
                  color: const Color(0xff434C6D).withValues(alpha: .8),
                ),
                textAlign: TextAlign.center,
                const TextSpan(
                  text: 'We just sent a 4-digit verification code to \n ',

                  children: [
                    WidgetSpan(
                      child: Text(
                        textDirection: TextDirection.ltr,
                        '+20 1022658997',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextSpan(
                      text:
                          '. Enter the code in the box  \n  below to continue.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              TextButton(
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,

                  alignment: AlignmentDirectional.centerStart,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Edit the number',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const AppVerfiyCode(),
              const AppResentOtp(),

              const SizedBox(height: 60),
              AppButton(
                title: 'Done',
                onPressed: () {
                  if (isComeSignUp) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SucessDialog(
                          isComeSignUp: isComeSignUp,
                        );
                      },
                    );
                  } else {
                    goTo(const CreatePasswordView());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
