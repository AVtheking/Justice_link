import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';
import 'package:justice_link/features/meetings/screens/appointment_payment.dart';

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
          // print(user);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: user == null
                ? const AppointmentPayment()
                : const AppointmentPayment(),
          );
        } else {
          // Return a loading indicator or placeholder while checking authentication
          return Center(child: const CircularProgressIndicator());
        }
      },
    );
  }
}
