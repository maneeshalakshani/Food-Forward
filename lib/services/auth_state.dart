import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

/// Use Command
/// <-- flutter packages pub run build_runner watch --delete-conflicting-outputs -->

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  String? userId;

  @action
  void setUserId({String? userId}) {
    this.userId = userId;
  }
}
