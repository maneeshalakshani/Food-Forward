import 'package:mobx/mobx.dart';

part 'food_state.g.dart';

/// Use Command
/// <-- flutter packages pub run build_runner watch --delete-conflicting-outputs -->

class FoodStore = _FoodStore with _$FoodStore;

abstract class _FoodStore with Store {
  @observable
  String? uploadedImageLink;

  @observable
  DateTime selectedDate = DateTime.now();

  @observable
  DateTime initialDate = DateTime.now();

  @action
  void setUploadedImageLink({String? uploadedImageLink}) {
    this.uploadedImageLink = uploadedImageLink;
  }

  @action
  void setSelectedDate({required DateTime selectedDate}) {
    this.selectedDate = selectedDate;
  }
}
