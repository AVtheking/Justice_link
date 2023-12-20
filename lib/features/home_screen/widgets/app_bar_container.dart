import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:justice_link/common/future.dart';
import 'package:justice_link/features/auth/services/auth_service.dart';

class TopBar extends ConsumerWidget {
  const TopBar({super.key});

  void logOut(BuildContext context, WidgetRef ref) {
    ref.read(authServiceProvider).logOut(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider);
    final lawyer = ref.read(lawyerProvider);
    // print(lawyer?.name);
    // print(user?.name);
    return Container(
      width: double.infinity,
      // height: 56,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                user != null
                    ? TranslateText(
                        englishText: "Welcome ${user.name}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600))
                    : TranslateText(
                        englishText: "Welcome ${lawyer!.name}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600)),
                // Text(
                //   translation == "Hindi"
                //       ? user != null
                //           ? "स्वागत है ${user.name}"
                //           : "स्वागत है ${lawyer!.name}"
                //       : user != null
                //           ? "Welcome ${user.name}"
                //           : "Welcome ${lawyer!.name}",
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 14,
                //       fontWeight: FontWeight.w600),
                // ),
                const TranslateText(
                    englishText: "Tuesday, December 4, 2023",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400))
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 5),
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
                  TranslateText(
                      englishText: "Logout",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13)),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.logout,
                    color: Color(0xFF004D14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
