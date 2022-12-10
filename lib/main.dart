import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_colon/state/auth/providers/auth_state_provider.dart';
import 'package:instagram_colon/state/auth/providers/is_logged_in_provider.dart';
import 'package:instagram_colon/state/providers/is_loading_provider.dart';
import 'package:instagram_colon/views/components/loading/loading_screen.dart';
import 'package:instagram_colon/views/login/login_view.dart';
import 'firebase_options.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        indicatorColor: Colors.blue.shade300,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        indicatorColor: Colors.blueGrey,
      ),
      themeMode: ThemeMode.dark,
      home: Consumer(
        builder: (context, ref, child) {
          // take care of display loading screen
          ref.listen<bool>(
            isLoadingProvider,
            (_, isLoading) {
              if (isLoading) {
                LoadingScreen.instance().show(
                  context: context,
                );
              } else {
                LoadingScreen.instance().hide();
              }
            },
          );

          final isLoggedIn = ref.watch(isLoggedInProvider);
          return isLoggedIn ? const MainView() : const LoginView();
        },
      ),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      body: Consumer(builder: (context, ref, child) {
        return TextButton(
          onPressed: ref.read(authStateProvider.notifier).logout,
          child: const Text('Logout'),
        );
      }),
    );
  }
}