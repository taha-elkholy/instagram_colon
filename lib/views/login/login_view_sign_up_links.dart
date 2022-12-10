import 'package:flutter/material.dart';
import 'package:instagram_colon/views/components/rich_text/base_text.dart';
import 'package:instagram_colon/views/components/rich_text/rich_text_widget.dart';
import 'package:instagram_colon/views/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginViewSignUpLink extends StatelessWidget {
  const LoginViewSignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleForAll: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.5,
          ),
      texts: [
        BaseText.plain(
          text: Strings.doNotHaveAnAccount,
        ),
        BaseText.plain(
          text: Strings.signUpOn,
        ),
        BaseText.link(
          onTapped: () {
            launchUrl(
              Uri.parse(
                Strings.facebookSignUpUrl,
              ),
            );
          },
          text: Strings.facebook,
        ),
        BaseText.plain(
          text: Strings.orCreateAnAccountOn,
        ),
        BaseText.link(
          onTapped: () {
            launchUrl(
              Uri.parse(
                Strings.googleSignUpUrl,
              ),
            );
          },
          text: Strings.google,
        ),
      ],
    );
  }
}
