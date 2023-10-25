import 'package:mobx/mobx.dart';

part 'payment_state.g.dart';

/// Use Command
/// <-- flutter packages pub run build_runner watch --delete-conflicting-outputs -->

class PaymentStore = _PaymentStore with _$PaymentStore;

abstract class _PaymentStore with Store {
  @observable
  String selectedPaymentMethod = "Cash on Delivery";

  @action
  void setPaymentMethod({required String selectedPaymentMethod}) {
    this.selectedPaymentMethod = selectedPaymentMethod;
  }
}
