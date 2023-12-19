import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
import 'package:justice_link/features/get_started/screens/get_started_screen.dart';
import 'package:justice_link/features/home_screen/screen/home_screen.dart';
import 'package:justice_link/features/home_screen/screen/home_screen_lawyer.dart';

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
    await ref.read(authServiceProvider).getLawyerData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _authFuture,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final user = ref.read(userProvider);
          final lawyer = ref.read(lawyerProvider);
          // print(lawyer);
          // print(user);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: lawyer == null
                ? user == null
                    ? const GetStartedScreen()
                    : const HomeScreen()
                : const HomeScreenLawyer(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
