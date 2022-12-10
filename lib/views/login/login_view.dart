import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_colon/state/auth/providers/auth_state_provider.dart';
import 'package:instagram_colon/views/constants/app_colors.dart';
import 'package:instagram_colon/views/constants/strings.dart';
import 'package:instagram_colon/views/login/divider_with_margins.dart';
import 'package:instagram_colon/views/login/facebook_button.dart';
import 'package:instagram_colon/views/login/google_button.dart';
import 'package:instagram_colon/views/login/login_view_sign_up_links.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              Strings.welcomeToAppName,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const DividerWithMargins(),
            Text(
              Strings.logIntoYourAccount,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    height: 1,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: ref.read(authStateProvider.notifier).loginWithFaceBook,
              style: TextButton.styleFrom(
                backgroundColor: AppColors.loginButtonColor,
                foregroundColor: AppColors.loginButtonTextColor,
              ),
              child: const FacebookButton(),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
              style: TextButton.styleFrom(
                backgroundColor: AppColors.loginButtonColor,
                foregroundColor: AppColors.loginButtonTextColor,
              ),
              child: const GoogleButton(),
            ),
            const DividerWithMargins(),
            const LoginViewSignUpLink(),
          ],
        ),
      ),
    );
  }
}
