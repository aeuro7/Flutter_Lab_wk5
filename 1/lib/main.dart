import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: const MyHomePage(title: 'Apple Store'),
      home: const MyHomePage(title: 'Euro App'),
    );
  }
}

DateTime now = DateTime.now();
String formattedDate = DateFormat('d MMMM yyyy').format(now);

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 46, 46),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRect(
          child: BackdropFilter(
            filter:
                ImageFilter.blur(sigmaX: 10000.0, sigmaY: 10000.0), // เพิ่มเบลอ
            child: AppBar(
              elevation: 0, // ลบเงา
              backgroundColor: Colors.white.withOpacity(0.3), // โปร่งใส
              surfaceTintColor: Colors.transparent, // ลบสีเงา
              title: Text(title),
              centerTitle: true,
            ),
          ),
        ),
      ),
      body: Center(
        
        child: Container(
          decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(20),
          child: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              alignment: Alignment.center,
              child: Text(
                '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 60),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              alignment: Alignment.center,
              child: Text(
                '${formattedDate}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              alignment: Alignment.center,
              child: Text(
                'I love you every day',
                style: TextStyle(fontSize: 15),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

String getFormattedDateThai(DateTime date) {
  List<String> months = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม'
  ];
  return '${date.day} ${months[date.month - 1]} ${date.year + 543}';
}
