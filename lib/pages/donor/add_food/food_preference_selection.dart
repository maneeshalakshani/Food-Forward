import 'package:flutter/material.dart';

class FoodPreferenceSelection extends StatefulWidget {
  final ValueChanged<String> onChanged;

  FoodPreferenceSelection({required this.onChanged});

  @override
  _FoodPreferenceSelectionState createState() => _FoodPreferenceSelectionState();
}

class _FoodPreferenceSelectionState extends State<FoodPreferenceSelection> {
  String _selectedPreference = 'Veg';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Food Preference",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Radio(
                value: 'veg',
                groupValue: _selectedPreference,
                onChanged: (value) {
                  setState(() {
                    _selectedPreference = value.toString();
                    widget.onChanged(_selectedPreference);
                  });
                },
              ),
              const Text('Veg'),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 'nonveg',
                groupValue: _selectedPreference,
                onChanged: (value) {
                  setState(() {
                    _selectedPreference = value.toString();
                    widget.onChanged(_selectedPreference);
                  });
                },
              ),
              const Text('Non-Veg'),
            ],
          ),
        ],
      ),
    );
  }
}
