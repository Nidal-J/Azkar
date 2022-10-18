import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String? _message;
  int? _count;

  @override
  Widget build(BuildContext context) {
    ModalRoute? modalRoute = ModalRoute.of(context);

    if (modalRoute != null) {
      Map<String, dynamic> data =
          modalRoute.settings.arguments as Map<String, dynamic>;
      debugPrint('$data');
      if (data.containsKey('message')) {
        _message = data['message'];
      }
      if (data.containsKey('count')) {
        _count = data['count'];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'عن التطبيق',
        ),
        backgroundColor: const Color(0xFF774360),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'تطبيق مسبحة الأذكار',
              style: GoogleFonts.cairo(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              height: 50,
              indent: 30,
              endIndent: 30,
              thickness: 1.4,
            ),
            Text(
              _message ?? 'message',
              style: GoogleFonts.cairo(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${_count ?? 0}',
              style: GoogleFonts.cairo(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
