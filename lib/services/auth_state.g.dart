// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$userIdAtom = Atom(name: '_AuthStore.userId', context: context);

  @override
  String? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$foodPreferenceAtom =
      Atom(name: '_AuthStore.foodPreference', context: context);

  @override
  String? get foodPreference {
    _$foodPreferenceAtom.reportRead();
    return super.foodPreference;
  }

  @override
  set foodPreference(String? value) {
    _$foodPreferenceAtom.reportWrite(value, super.foodPreference, () {
      super.foodPreference = value;
    });
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  void setUserId({String? userId}) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setUserId');
    try {
      return super.setUserId(userId: userId);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFoodPreference({required String foodPreference}) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setFoodPreference');
    try {
      return super.setFoodPreference(foodPreference: foodPreference);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userId: ${userId},
foodPreference: ${foodPreference}
    ''';
  }
}
