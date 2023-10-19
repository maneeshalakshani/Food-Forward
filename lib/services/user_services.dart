import 'package:cloud_firestore/cloud_firestore.dart';

class UserUtilities{
  getAllFoodWithUserId({required String userId}) {
    return FirebaseFirestore.instance
      .collection("Foods")
      .where('userId', isEqualTo: userId);
  }

  getAllFood() {
    return FirebaseFirestore.instance
      .collection("Foods");
  }

  Future<int> getNumberOfItems({required String userId}) async {
    QuerySnapshot querySnapshot = await getAllFoodWithUserId(userId: userId).get();
    int itemCount = querySnapshot.size;
    return itemCount;
  }

  Future<int> getAllDonations() async {
    QuerySnapshot querySnapshot = await getAllFood().get();
    int itemCount = querySnapshot.size;
    return itemCount;
  }


  Future<double> getTotalDonation({required String userId}) async {
    final userDonations = await getNumberOfItems(userId: userId);
    final allDonations = await getAllDonations();
    
    if (allDonations == 0) {
      return 0.0; // Avoid division by zero
    }
    
    return (userDonations.toDouble() / allDonations.toDouble()) * 100.00;
  }


  Future<double> getTotalEnvironmentalImpactForUser({required String userId}) async {
    final QuerySnapshot querySnapshot = await getAllFoodWithUserId(userId: userId).get();
    double totalEnvironmentalImpact = 0.0;

    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      final foodData = document.data() as Map<String, dynamic>;
      final environmentalImpact = foodData['environmentalImpact'].toDouble();

      totalEnvironmentalImpact += environmentalImpact;
    }

    return totalEnvironmentalImpact;
  }

  Future<double> getTotalEnvironmentalImpactForAllFoods() async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Foods")
        .get();
    double totalEnvironmentalImpact = 0.0;

    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      final foodData = document.data() as Map<String, dynamic>;
      final environmentalImpact = foodData['environmentalImpact'].toDouble();

      totalEnvironmentalImpact += environmentalImpact;
    }

    return totalEnvironmentalImpact.toDouble();
  }

  Future<double> calculateEnvironmentalImpactRatio({required String userId}) async {
    final totalEnvironmentalImpactForUser = await getTotalEnvironmentalImpactForUser(userId: userId);
    final totalEnvironmentalImpactForAllFoods = await getTotalEnvironmentalImpactForAllFoods();

    if (totalEnvironmentalImpactForAllFoods == 0) {
      return 0.0; // Avoid division by zero
    }

    return (totalEnvironmentalImpactForUser / totalEnvironmentalImpactForAllFoods).toDouble();
  }

  double calculateCommunityContributionsPercentage(double percentageEnvironmentalImpact, double percentageTotalDonations) {
    return (percentageEnvironmentalImpact + percentageTotalDonations).toDouble() / 2.0;
  }  
}