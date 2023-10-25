// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentStore on _PaymentStore, Store {
  late final _$selectedPaymentMethodAtom =
      Atom(name: '_PaymentStore.selectedPaymentMethod', context: context);

  @override
  String get selectedPaymentMethod {
    _$selectedPaymentMethodAtom.reportRead();
    return super.selectedPaymentMethod;
  }

  @override
  set selectedPaymentMethod(String value) {
    _$selectedPaymentMethodAtom.reportWrite(value, super.selectedPaymentMethod,
        () {
      super.selectedPaymentMethod = value;
    });
  }

  late final _$_PaymentStoreActionController =
      ActionController(name: '_PaymentStore', context: context);

  @override
  void setPaymentMethod({required String selectedPaymentMethod}) {
    final _$actionInfo = _$_PaymentStoreActionController.startAction(
        name: '_PaymentStore.setPaymentMethod');
    try {
      return super
          .setPaymentMethod(selectedPaymentMethod: selectedPaymentMethod);
    } finally {
      _$_PaymentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedPaymentMethod: ${selectedPaymentMethod}
    ''';
  }
}
