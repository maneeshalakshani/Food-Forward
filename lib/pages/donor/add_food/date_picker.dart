import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_forward/pages/donor/add_food/food_state.dart';

// ignore: must_be_immutable
class DatePickerWidget extends HookWidget {
  DatePickerWidget({
    Key? key,
    required this.store,
  }) : super(key: key);
  FoodStore store;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width/10 * 7.5,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (BuildContext context){
              return Text(
                "${store.selectedDate.toLocal()}".split(' ')[0], // Display selected date
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              );
            },
          ),
          // const SizedBox(
          //   height: 20.0,
          // ),
          ElevatedButton(
            onPressed: () => _selectDate(context), // Open date picker
            child: Text('Select Expire Date date'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: store.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != store.selectedDate) {
      // Update the selected date
      store.setSelectedDate(selectedDate: picked);
    }
  }

}
