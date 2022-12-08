import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_colon/state/auth/providers/auth_state_provider.dart';
import 'package:instagram_colon/state/auth/providers/is_logged_in_provider.dart';
import 'package:instagram_colon/views/components/constants/loading/loading_screen.dart';
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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final isLoggedIn = ref.watch(isLoggedInProvider);
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
      home: isLoggedIn ? const MainView() : const LoginView(),
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

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: Consumer(
        builder: ((context, ref, child) {
          return Column(
            children: [
              TextButton(
                onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
                child: const Text('Login with Google'),
              ),
              TextButton(
                onPressed:
                    ref.read(authStateProvider.notifier).loginWithFaceBook,
                child: const Text('Login with FaceBook'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
