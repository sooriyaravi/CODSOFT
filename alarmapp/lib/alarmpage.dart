import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Alarmpage extends StatefulWidget {
  const Alarmpage({super.key});

  @override
  State<Alarmpage> createState() => _AlarmpageState();
}

class _AlarmpageState extends State<Alarmpage> {
  String currentTime = '';
  String currentDate = '';
  @override
  void initState() {
    super.initState();
    updatetime();
  }

  void updatetime() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        DateTime now = DateTime.now();
        currentTime = DateFormat('hh:mm:ss a').format(now);
        currentDate = DateFormat('MMM d,EEE,yyyy').format(now);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Alarm'),
        backgroundColor: Colors.blue.shade400,
      ),
      backgroundColor: Colors.blue.shade400,
      body: Center(
        child: Column(
          children: [
            Text(
              currentTime,style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold),
            ),
            Text(
              currentDate,style:  GoogleFonts.museoModerno(fontSize: 24),
            )
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.white.withOpacity(0.2),
        child: Icon(Icons.add,size:40,color: Colors.white,),
        elevation: 0,
        shape: CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        
    );
    
  }
}
