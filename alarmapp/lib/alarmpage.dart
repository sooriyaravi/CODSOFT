import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
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
  TimeOfDay? AlarmTime;
  
  List<TimeOfDay> alarms = [];
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

 

  void alarmpicker(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      setState(() {
        alarms.add(selectedTime);
      });
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm'),
        backgroundColor: Colors.blue.shade400,
      ),
      backgroundColor: Colors.blue.shade400,
      body: Center(
        child: Column(
          children: [
            Text(
              currentTime,
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              currentDate,
              style: GoogleFonts.museoModerno(fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
           
            Expanded(
                child: alarms.isEmpty
                    ? Center(
                        child: Text(
                          'no Alarm set',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    : ListView.builder(
                        itemCount: alarms.length,
                        itemBuilder: (context, index) {
                          final alarm = alarms[index];
                          return ListTile(
                            title: Text(
                              'Alarm set for : ${alarm.format(context)}',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    alarms.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.delete)),
                          );
                        },
                      ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          alarmpicker(context);
        },
        backgroundColor: Colors.white.withOpacity(0.2),
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
        elevation: 0,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
