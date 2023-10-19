import 'package:cloud_firestore/cloud_firestore.dart';

class UserUtilities{
  getAllFoodWithUserId() {
    return FirebaseFirestore.instance
      .collection("Foods")
      .where('userId', isEqualTo: 'er242dYU');
  }

  getAllFood() {
    return FirebaseFirestore.instance
      .collection("Foods");
  }

  Future<int> getNumberOfItems() async {
    QuerySnapshot querySnapshot = await getAllFoodWithUserId().get();
    int itemCount = querySnapshot.size;
    return itemCount;
  }

  Future<int> getAllDonations() async {
    QuerySnapshot querySnapshot = await getAllFood().get();
    int itemCount = querySnapshot.size;
    return itemCount;
  }


  Future<double> getTotalDonation() async {
    final userDonations = await getNumberOfItems();
    final allDonations = await getAllDonations();
    
    if (allDonations == 0) {
      return 0.0; // Avoid division by zero
    }
    
    return (userDonations.toDouble() / allDonations.toDouble()) * 100.00;
  }


  Future<double> getTotalEnvironmentalImpactForUser() async {
    final QuerySnapshot querySnapshot = await getAllFoodWithUserId().get();
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

  Future<double> calculateEnvironmentalImpactRatio() async {
    final totalEnvironmentalImpactForUser = await getTotalEnvironmentalImpactForUser();
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