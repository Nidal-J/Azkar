import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int tasbeehCounter = 0;
String typeOfTasbeeh = 'سبحان الله';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'مسبحة الأذكار',
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/info_screen',
                arguments: {
                  'message': typeOfTasbeeh,
                  'count': tasbeehCounter,
                },
              );
            },
            icon: const Icon(Icons.info),
          ),
          PopupMenuButton<String>(
            color: const Color(0xFFF1EEE9),
            onSelected: (value) {
              if (value != typeOfTasbeeh) {
                typeOfTasbeeh = value;
                tasbeehCounter = 0;
                setState(() {});
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'سبحان الله',
                  child: Text(
                    'سبحان الله',
                    style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'الحمد لله',
                  child: Text(
                    'الحمد لله',
                    style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'أستغفر الله',
                  child: Text(
                    'أستغفر الله',
                    style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsIconTheme: const IconThemeData(color: Colors.black87),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tasbeehCounter++;
          setState(() {});
        },
        backgroundColor: const Color(0xFF774360),
        tooltip: 'زيادة عداد التسبيح',
        child: const Icon(Icons.add),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0xFFEC994B),
              Color(0xFFF1EEE9),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer(),
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('images/allah_name.jpg'),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                color: const Color(0xFFF1EEE9),
                margin: const EdgeInsets.only(bottom: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        typeOfTasbeeh,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.arefRuqaa(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: const Color(0xFFDF7861),
                      alignment: Alignment.center,
                      child: Text(
                        '$tasbeehCounter',
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        tasbeehCounter++;
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 45),
                        backgroundColor: const Color(0xFF774360),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(15.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'تسبيح',
                        style: GoogleFonts.cairo(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onLongPress: () {
                        debugPrint('long pressed');
                        tasbeehCounter++;
                        setState(() {});
                      },
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        tasbeehCounter = 0;
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 45),
                        backgroundColor: const Color(0xFFB25068),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(15.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'إعادة',
                        style: GoogleFonts.cairo(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // FloatingActionButton(onPressed: () {}),
              // Spacer(),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: FloatingActionButton(
              //     onPressed: () {
              //       counter++;
              //       setState(() {});
              //     },
              //     child: const Icon(Icons.add),
              //   ),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
