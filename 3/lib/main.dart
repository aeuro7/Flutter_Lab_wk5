import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Restaurant App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const MyScreen());
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 999999999999999999.0, sigmaY: 999999999999999999.0), // เพิ่มเบลอ
            child: AppBar(
              elevation: 0, // ลบเงา
              backgroundColor: Colors.white.withOpacity(0.3), // โปร่งใส
              surfaceTintColor: Colors.transparent, // ลบสีเงา
              title: Text('My Profile'),
              centerTitle: true,
            ),
          ),
        ),
      ),
        body: Stack(
      children: [
        
        Image.asset('assets/images/wall.jpg'),
        Transform.translate(
            offset: const Offset(0, 150),
            child: const Column(children: [
              MyProfile(),
              MyDetails(),
              MyAction(),
            ]))
      ],
    ));
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'assets/images/dog4.png',
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MyDetails extends StatelessWidget {
  const MyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Euro Euro',
            style:
                GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          MyStar(),
          _buildDetailRow('Age', '18'),
          _buildDetailRow('Status', 'Good')
        ]));
  }
}

Widget _buildDetailRow(String title, String value) {
  return Row(
    children: [
      Text(
        '$title',
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Text(' : ' + value,
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500))
    ],
  );
}

class MyAction extends StatelessWidget {
  const MyAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildIcon(Icons.restaurant, 'Feed'),
        _buildIcon(Icons.favorite, 'Pet'),
        _buildIcon(Icons.directions_walk, 'Walk'),
      ],
    );
  }

  Widget _buildIcon(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 40),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}


class MyStar extends StatelessWidget {
  const MyStar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(5, (index) {
                  return const Icon(
                    Icons.star,
                    color:
                        Color.fromARGB(255, 243, 186, 0), // ตั้งค่าเป็นสีเหลือง
                    size: 20.0,
                  );
                }),
              ),
            );
  }

}