import 'package:food_forward/pages/tips/tips_list.dart';
import 'package:mobx/mobx.dart';

part 'tip_state.g.dart';

/// Use Command
/// <-- flutter packages pub run build_runner watch --delete-conflicting-outputs -->

class TipStore = _TipStore with _$TipStore;

abstract class _TipStore with Store {
  @observable
  List<TipItem> tipsList = [
    TipItem(
      tipTitle: "Maximize Your Food Donations", 
      text: "Make your grocery shopping more eco-friendly and reduce food waste with these steps.",
      steps: [
        "Plan Your Meals: Before heading to the store, plan your meals for the week. Create a shopping list based on what you'll actually use",
        "Check Your Pantry: Take a quick inventory of what you already have at home. Avoid buying items you already have.",
        "Buy in Bulk Mindfully: Purchase perishable items in smaller quantities to reduce spoilage. For non-perishables, consider buying in bulk if it makes sense for your household.",
        "Mind the Expiry Dates: Pay attention to expiration dates. Choose items with a longer shelf life or those that can be frozen for later use.",
      ],
      stepReadDetector: [false, true, false, false],
    ),
    TipItem(
      tipTitle: "Organize Your Pickup Schedule", 
      text: "Consider following steps",
      steps: [
        "Plan Ahead: Coordinate with local food donors to schedule food pickups in advance. Set a regular pickup schedule to streamline the process and reduce last-minute rushes.",
        "Efficient Routes: Map out efficient routes for pickups. Group locations close to each other on the same day to save time and reduce travel emissions. Consider using navigation apps to help you navigate the best routes.",
        "Confirm and Communicate: Confirm pickup times with the donors to avoid any unexpected delays. Maintain clear communication with the food donors and recipients, so everyone is informed about pickup times and locations.",
      ],
      stepReadDetector: [false, false, true],
    ),
    TipItem(
      tipTitle: "Reduce Packaging Waste", 
      text: "Consider following steps",
      steps: [
        "Bring Reusable Containers: Carry reusable containers and bags for food transport. These are eco-friendly and help reduce single-use packaging waste.",
        "Encourage Donors: Encourage food donors to use eco-friendly packaging. Suggest they use containers that can be easily cleaned and reused.",
        "Educate Recipients: Educate food recipients about the importance of reusing or recycling food packaging to minimize waste.",
      ],
      stepReadDetector: [true, true, false],
    ),
    TipItem(
      tipTitle: "Minimize Food Handling Risks", 
      text: "Consider following steps",
      steps: [
        "Follow Safety Guidelines: Adhere to food safety guidelines when handling donated food. Ensure it's stored and transported at the appropriate temperature to prevent spoilage.",
        "Use Protective Gear: Wear protective gear like gloves when handling food to maintain hygiene standards.",
        "Regular Health Checks: If you're a volunteer, consider regular health check-ups to ensure you're fit for handling and delivering food.",
      ],
      stepReadDetector: [false, false, true],
    ),
    TipItem(
      tipTitle: "Donate Excess Food Responsibly", 
      text: "Consider following steps",
      steps: [
        "Identify Surplus Food: Keep track of food quantities that exceed your personal or household needs.",
        "Connect with Local Organizations: Contact local food banks or charities that accept food donations. Inquire about their requirements and procedures for food donations.",
        "Schedule Regular Donations: Establish a regular donation schedule to ensure that excess food is consistently redirected to those in need.",
      ],
      stepReadDetector: [false, false, false],
    ),
  ];

  @observable
  int noOfReads = 0;

  @action
  void setTipReader({required bool isRead, required int tipId, required int stepId}) {
    tipsList[tipId].stepReadDetector[stepId] = isRead;
    print("Changed Data: ${tipsList[tipId].stepReadDetector[stepId]}");
  }

  @action
  void setNoOfReads({required int noOfReads}) {
    this.noOfReads = noOfReads;
    print(noOfReads);
  }
}
