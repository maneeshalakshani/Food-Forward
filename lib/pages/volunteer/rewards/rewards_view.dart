import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/models/Food.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/volunteer/rewards/reward_card.dart';
import 'package:food_forward/pages/volunteer/rewards/reward_state.dart';
import 'package:food_forward/services/authentication.dart';
import 'package:food_forward/services/donor/donor_services.dart';
import 'package:food_forward/services/volunteer/volunteer_services.dart';

class VolunteerRewardView extends HookWidget {
  const VolunteerRewardView({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    RewardStore store = RewardStore();

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: AssetImage(
                    "assets/avatar.png",
                  ),
                ),
                const SizedBox(width: 20,),
                FutureBuilder<Map<String, dynamic>?>(
                  future: Authentications().getCurrentUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (snapshot.hasData) {
                      final userData = snapshot.data;
                      final name = userData?['name'] ?? 'Name not found';
                      final email = userData?['email'] ?? 'Email not found';
                  
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 105, 28, 22),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            email,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 105, 28, 22),
                            ),
                          ),
                          FutureBuilder<String>(
                            future: getTitles(userId: store.userId!),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text("Error: ${snapshot.error}");
                              } else if (snapshot.hasData) {
                                final data = snapshot.data;
                                store.setTitle(title: data!);
                            
                                return Text(
                                      data,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 105, 28, 22),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                              } else {
                                return Text("User data not found");
                              }
                            },
                          )
                        ],
                      );
                    } else {
                      return Text("User data not found");
                    }
                  },
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: DonorFunction().getAllFood(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  }
                  if (snapshot.hasData) {
                    return buildList(context, snapshot.data?.docs, store);
                  }
                  return const Text("Loading...");
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot>? snapshot, RewardStore store) {
    for(int i=0; i<(snapshot == null ? 0 : snapshot.length); i++){
      addDiscount(userId: store.userId!, title: store.title, data: snapshot![i]);
    }
    return ListView.builder(
      itemCount: snapshot!.length,
      itemBuilder: (context, int index) {
        return RewardCard(
          context: context,
          data: snapshot[index],
          discountCode: "seYFJjh34",
        );
      },
    );
  }

  checkNoOfCompletedTasks({required String userId}) async {
    QuerySnapshot querySnapshot = await VolunteerFunctions().getAllCompletedTasksWithUser(userId: userId);
    return querySnapshot.size;
  }

  Future<String> getTitles({required String userId}) async {
    int noOfCompletedTasks = await checkNoOfCompletedTasks(userId: userId);
    if(noOfCompletedTasks >= 50){
      return "Gold User";
    }else if(noOfCompletedTasks >= 25){
      return "Silver User";
    }else if(noOfCompletedTasks >= 10){
      return "Bronze User";
    }else{
      return "Normal user";
    }
  }

  double generateDiscountValue({required String title}){
    if(title == "Gold User"){
      return 1000.0;
    }else if(title == "Silver User"){
      return 800.0;
    }else if(title == "Bronze User"){
      return 500.0;
    }else{
      return 300.0;
    }
  }

  String generateRandomCode() {
    final random = Random();
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const codeLength = 8;
    String code = '';

    for (int i = 0; i < codeLength; i++) {
      code += chars[random.nextInt(chars.length)];
    }

    return code;
  }

  addDiscount({required String userId, required String title, required DocumentSnapshot data}) async {
    double value = generateDiscountValue(title: title);
    String code = generateRandomCode();
    final food = Food.fromSnapshot(data);

    VolunteerFunctions().createDiscount(
      code: code, 
      value: value, 
      foodId: data.id, 
      foodName: food.name, 
      price: food.price,
    );
  }
  
}
