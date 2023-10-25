import 'package:flutter/material.dart';
import 'package:food_forward/pages/tips/tip_state.dart';

class TipDetailedCard extends StatefulWidget {
  TipDetailedCard({
    Key? key, 
    required this.stepNumber,
    required this.tipId,
    required this.tipStore,
    required this.text,
  }) : super(key: key);

  final String text;
  final int stepNumber;
  final TipStore tipStore;
  final int tipId;

  @override
  _TipDetailedCardState createState() => _TipDetailedCardState();
}

class _TipDetailedCardState extends State<TipDetailedCard> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    // Initialize the checkbox state based on tipStore data
    _isChecked = widget.tipStore.tipsList[widget.tipId].stepReadDetector[widget.stepNumber];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: width / 10,
            child: Center(
              child: Text(
                (widget.stepNumber + 1).toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            width: width / 10 * 6.5,
            child: Text(
              widget.text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            width: width / 10 * 1.5,
            child: Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                  // Update the tipStore data
                  widget.tipStore.setTipReader(isRead: value, tipId: widget.tipId, stepId: widget.stepNumber);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
