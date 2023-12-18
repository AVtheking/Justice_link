import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';

class TopBar extends ConsumerWidget {
  const TopBar({super.key});

  void logOut(BuildContext context, WidgetRef ref) {
    ref.read(authServiceProvider).logOut(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF004D14),
            const Color(0xFF004D14).withOpacity(0.7),
            const Color(0xFF046200)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.0, 0.7, 0.9],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              "assets/images/1.png",
              height: 40,
              width: 40,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Tue,December 4,2023",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {
                logOut(context, ref);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(77, 30),
              ),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Log Out",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    // const Spacer(),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.logout,
                      color: Color(0xFF004D14),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
