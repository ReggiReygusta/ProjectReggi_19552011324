import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePage extends StatefulWidget {
  const DatePage({Key? key}) : super(key: key);

  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateformat = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _getDate(context);
            },
            // ignore: prefer_const_constructors
            child: Text('Date Picker'),
          ),
          Text('Date Value : ' + _dateformat.format(_selectedDate)),
        ],
      )),
    );
  }

  _getDate(context) async {
    final _datePick = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _selectedDate.subtract(
        const Duration(days: 30),
      ),
      lastDate: DateTime(_selectedDate.year + 1),
    );

    if (_datePick != null) {
      setState(() {
        _selectedDate = _datePick;
      });
    }
  }
}
