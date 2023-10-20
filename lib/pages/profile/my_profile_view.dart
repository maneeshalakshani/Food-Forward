import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/profile/horizontal_scroll_card.dart';
import 'package:food_forward/pages/profile/share_card.dart';
import 'package:food_forward/pages/profile/srollIems.dart';
import 'package:food_forward/services/badges/badges.dart';
import 'package:food_forward/services/user_services.dart';

class MyProfileView extends HookWidget {
  const MyProfileView({
    Key? key, 
    required this.userId,
    required this.name,
  }) : super(key: key);
  final String name;
  final String userId;


  @override
  Widget build(BuildContext context) {
    // Call addBadges when the widget is built (page loads)
    useEffect(() {
      addBadges(userId: userId);
      return null; // Return null to indicate no cleanup is needed
    }, []);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: Column(
        children: [
          Container(
            width: width,
            height: height/15,
            color: LIGHT_PINK,
            child: const Center(
              child: Text(
                "My Profile", 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height/10 * 1.8,
            child: Row(
              children: [
                SizedBox(
                  width: width/2.5,
                  child: const Center(
                    child: CircleAvatar(
                      maxRadius: 45,
                      backgroundImage: AssetImage(
                        "assets/avatar.png",
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FutureBuilder<String>(
                      future: getTitles(userId: "er242dYU"),
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Text(
                            snapshot.data ?? 'Default Value', 
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.purple,
                            ),
                          );
                        } else {
                          return const Text(
                            'Loading...', 
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.purple,
                            ),
                          );
                        }
                      },
                    ),
                    Image.asset(
                      "assets/red.png",
                      height: 40,
                    )
                  ],
                ),
              ],
            ),
          ),

          //horizontal scroll
          Container(
            width: width,
            height: height / 10,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1)
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: horizontalScrollList.length,
              itemBuilder: (context, i){
                return ScrollCard(
                  imageURL: horizontalScrollList[i].imageURL, 
                  textLabel: horizontalScrollList[i].name,
                  route: horizontalScrollList[i].route,
                );
              }, separatorBuilder: (BuildContext context, int index) => Container(color: Colors.black, width: 1,),
            ),
          ),
          Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: BadgesFunction().getAllBadges(userId: userId),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error ${snapshot.error}');
                    }
                    if (snapshot.hasData) {
                      return buildList(context, snapshot.data?.docs);
                    }
                    return const Text("Loading...");
                  },
                ),
              ) 
        ],
      ),
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
    return ListView.separated(
      itemCount: snapshot!.length,
      itemBuilder: (context, int index) {
        return ShareCard(
          context: context,
          data: snapshot[index],
        );
      },
      separatorBuilder: (context, i)=> const SizedBox(height: 10,)
    );
  }

  getPercentage() async {
    UserUtilities userUtilities = UserUtilities();
    double totDonations = await userUtilities.getTotalDonation(userId: userId);
    double envImpact = await userUtilities.calculateEnvironmentalImpactRatio(userId: userId);
    double comContributions = userUtilities.calculateCommunityContributionsPercentage(envImpact, totDonations);
    return [totDonations, envImpact, comContributions];
  }

  addBadges({required String userId}) async {
    List<double> percentages = await getPercentage();
    List<String> categories = ['donation', 'env', 'community'];

    for(int i=0; i<percentages.length; i++){
      int noOfBadges = await checkBadgeAlreadyReceived(category: categories[i], userId: userId);

      if((percentages[i] > 75 && noOfBadges < 3) || (percentages[i] > 40 && noOfBadges < 2) || (percentages[i] > 30 && noOfBadges < 1)){

        if(percentages[i] >= 75 && noOfBadges < 3){
          BadgesFunction().createBadge(
            name: "red", 
            category: categories[i], 
            description: i == 0
              ? "Red Badge: You're a top-tier food donor, making a significant difference in the fight against food waste!"
              : i == 1
                ? "Red Badge: You're a sustainability hero, significantly reducing CO2 emissions through your actions!"
                : "Red Badge: You're a food donation champion, making a big impact on reducing food waste!", 
            userId: userId, 
            imageUrl: "assets/red.png"
          );          
        }
        
        if(percentages[i] >= 40 && noOfBadges < 2){
          BadgesFunction().createBadge(
            name: "orange", 
            category: categories[i], 
            description: i == 0
              ? "Orange Badge: Awarded for your outstanding dedication to food donations. You're making a real impact!"
              : i == 1
                ? "Orange Badge: You're making a greener planet with your eco-friendly contributions. Great job!"
                : "Orange Badge: Your consistent food donations are helping those in need. Keep it up!", 
            userId: userId, 
            imageUrl: "assets/orr.png"
          );    
        }
        
        if(percentages[i] >= 30 && noOfBadges < 1){
          BadgesFunction().createBadge(
            name: "yellow", 
            category: categories[i], 
            description: i == 0
              ? "Yellow Badge: Achieved for making a significant contribution to food donations. Keep up the good work!"
              : i == 1
                ? "Yellow Badge: Acknowledged for your efforts in reducing CO2 emissions through your food donations."
                : "Yellow Badge: Recognized for your generosity in donating food items. Your efforts are truly appreciated!", 
            userId: userId, 
            imageUrl: "assets/yell.png"
          );  
        }
      }
    }
  }

  checkBadgeAlreadyReceived({required String category, required String userId}) async {
    QuerySnapshot querySnapshot = await BadgesFunction().getAllBadgesWithCategory(userId: userId, category: category);
    return querySnapshot.size;
  }

  checkNoOfRedBadges({required String name, required String userId}) async {
    QuerySnapshot querySnapshot = await BadgesFunction().getAllBadgesWithName(userId: userId, name: name);
    return querySnapshot.size;
  }

  Future<String> getTitles({required String userId}) async {
    int redBadges = await checkNoOfRedBadges(name: "red", userId: userId);
    if(redBadges > 3){
      return "Platinum User $redBadges";
    }else if(redBadges == 3){
      return "Gold User 3/3";
    }else if(redBadges == 2){
      return "Silver User 2/3";
    }else if(redBadges == 1){
      return "Bronze User 1/3";
    }else{
      return "Normal user";
    }
  }
}
