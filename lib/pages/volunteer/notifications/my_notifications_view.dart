import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/volunteer/notifications/notification_card.dart';

class VolunteerNotificationsView extends HookWidget {
  const VolunteerNotificationsView({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Title(
                color: Colors.black, 
                child: const Text(
                  "My Notifications",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: height/10 * 7.8,
                width: width,
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i){
                    return NotificationCard(
                      orderNo: "afw456zUY", 
                      totalPrice: 100, 
                      seeLocationOnTap: (){},
                      acceptOnPress: (){},
                      rejectOnPress: (){},
                    );
                  },
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}
