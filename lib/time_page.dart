import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _getTime(context);
              },
              child: const Text('Time Picker'),
            ),
            Text(
              'Time Value : ' + _selectedTime.format(context),
            ),
          ],
        ),
      ),
    );
  }

  _getTime(context) async {
    final _timePick = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          );
        });
    if (_timePick != null) {
      setState(() {
        _selectedTime = _timePick;
      });
    }
  }
}
