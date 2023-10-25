import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_forward/pages/donor/add_food/food_state.dart';

// ignore: must_be_immutable
class DatePickerWidget extends StatefulWidget {
  final FoodStore store;
  DateTime selectedDate;

  DatePickerWidget({
    Key? key,
    required this.store,
    required this.selectedDate,
  }) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width / 10 * 7.5,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (BuildContext context) {
              return Text(
                "${widget.store.selectedDate.toLocal()}".split(' ')[0], // Display selected date
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              );
            },
          ),
          // Text(
          //   "${widget.selectedDate}".split(' ')[0], // Display selected date
          //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          // ),
          ElevatedButton(
            onPressed: () => _selectDate(context), // Open date picker
            child: const Text('Select Expire Date date'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.store.initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != widget.store.selectedDate) {
      // Update the selected date
      widget.store.setSelectedDate(selectedDate: picked);
      setState(() {
        widget.selectedDate = picked;
      });
    }
  }
}
