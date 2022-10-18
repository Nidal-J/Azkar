import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, '/home_screen');
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return const HomeScreen();
        //     },
        //   ),
        // );
      },
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // @override
  // void deactivate() {
  //   super.deactivate();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 119, 48, 87),
              Color(0xFFB25068),
              Color.fromARGB(255, 216, 140, 159),
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'مسبحة الأذكار',
              style: GoogleFonts.cairo(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFEFEFEF),
              ),
            ),
            const Spacer(),
            Text(
              'v1.0.0 @ 2022 by Nidal Alraey',
              style: GoogleFonts.cairo(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: const Color(0xDDEFEFEF),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
