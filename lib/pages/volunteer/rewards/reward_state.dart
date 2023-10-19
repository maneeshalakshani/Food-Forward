import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'reward_state.g.dart';

/// Use Command
/// <-- flutter packages pub run build_runner watch --delete-conflicting-outputs -->

class RewardStore = _RewardStore with _$RewardStore;

abstract class _RewardStore with Store {
  @observable
  String? userId = FirebaseAuth.instance.currentUser?.uid;

  @observable
  String title = "Normal User";

  @action
  void setUserId({String? userId}) {
    this.userId = userId;
  }

  @action
  void setTitle({required String title}) {
    this.title = title;
  }
}
