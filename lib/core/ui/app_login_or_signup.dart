import '../logic/helper_methods.dart';
import '../../views/auth/login.dart';
import '../../views/auth/sign_up.dart';
import 'package:flutter/material.dart';

class AppLoginOrSignup extends StatelessWidget {
  const AppLoginOrSignup({
    super.key,

    this.isLogin = false,
  });
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: isLogin ? 'Don’t have an account?' : 'Have an account?',
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment
                  .middle, // if you want a text button in middle
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity
                      .compact, //   if you want to textbutton small
                ),
                onPressed: () =>
                    goTo(isLogin ? const SignUpView() : const LoginView()),
                child: Text(isLogin ? 'register' : 'login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
