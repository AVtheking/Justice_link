import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/auth/screens/sign_up.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
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
  late Future<void> _authFuture;

  @override
  void initState() {
    super.initState();
    _authFuture = checkAuth(context);
  }

  Future<void> checkAuth(BuildContext context) async {
    await ref.read(authServiceProvider).getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _authFuture,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final user = ref.read(userProvider);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: user == null ? const Register() : const HomeScreen(),
          );
        } else {
          return const Center(child:  CircularProgressIndicator());
        }
      },
    );
  }
}
