import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/tips/tip_state.dart';
import 'package:food_forward/pages/tips/tips_list.dart';
import 'package:food_forward/routes/routes.gr.dart';

class TipCard extends StatefulWidget {
  const TipCard({
    Key? key, 
    required this.imageURL,
    required this.tipLabel,
    required this.tipID,
    required this.tipItem,
    required this.tipStore,
  }) : super(key: key);
  final String imageURL;
  final String tipLabel;
  final int tipID;
  final TipItem tipItem;
  final TipStore tipStore;

  @override
  _TipCardState createState() => _TipCardState();
}

class _TipCardState extends State<TipCard> {
  late int _noOfReads;
  late double redShow;
  late int yellows;
  late double yellowShow;

  @override
  void initState() {
    super.initState();
    _calculateNoOfReads();
  }

  int _calculateNoOfReads() {
    int reads = 0;
    double oneSection = 0;
    for (int i = 0; i < widget.tipStore.tipsList[widget.tipID].stepReadDetector.length; i++) {
      if (widget.tipStore.tipsList[widget.tipID].stepReadDetector[i] == true) {
        reads++;
      }
    }
    setState(() {
      _noOfReads = reads;
      yellows = widget.tipStore.tipsList[widget.tipID].stepReadDetector.length - reads;
      oneSection = 60 / widget.tipStore.tipsList[widget.tipID].stepReadDetector.length;
      redShow = _noOfReads * oneSection;
      yellowShow =  yellows * oneSection;
    });

    print(_noOfReads);
    return reads;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      color: LIGHT_PINK,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    widget.imageURL,
                    height: 60,
                  ),
                ),
                Container(
                  width: width / 3 * 1.7,
                  child: Text(
                    widget.tipLabel,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Observer(
                  builder: (context) {
                    return Container(
                      // width: 80,
                      // height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: redShow,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              color: Color.fromARGB(255, 206, 11, 11),
                            ),
                          ),
                          Container(
                            width: yellowShow,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: const Radius.circular(10.0),
                                bottomRight: const Radius.circular(10.0),
                                topLeft: _noOfReads == 0 ? const Radius.circular(10.0) : const Radius.circular(0.0),
                                bottomLeft: _noOfReads == 0 ? const Radius.circular(10.0) : const Radius.circular(0.0)
                              ),
                              color: const Color.fromARGB(255, 80, 189, 252),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    context.router.push(ExpandedTipRoute(tipID: widget.tipID, tipItem: widget.tipItem, tipStore: widget.tipStore));
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(DARK_PINK),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: const Text("See what you can do"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
