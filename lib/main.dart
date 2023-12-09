import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/auth/screens/sign_up.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
import 'package:justice_link/features/get_started/screens/get_started_screen.dart';
import 'package:justice_link/features/home_screen/screen/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Future<void> checkAuth(BuildContext context) async {
    await ref.read(authServiceProvider).getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkAuth(context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final user = ref.read(userProvider);
          print(user);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: user == null ? const Register() : const GetStartedScreen(),
          );
        } else {
          // Return a loading indicator or placeholder while checking authentication
          return Center(child: const CircularProgressIndicator());
        }
      },
    );
  }
}
