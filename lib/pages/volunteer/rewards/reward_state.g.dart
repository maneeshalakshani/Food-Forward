// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RewardStore on _RewardStore, Store {
  late final _$userIdAtom = Atom(name: '_RewardStore.userId', context: context);

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

  late final _$titleAtom = Atom(name: '_RewardStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$_RewardStoreActionController =
      ActionController(name: '_RewardStore', context: context);

  @override
  void setUserId({String? userId}) {
    final _$actionInfo = _$_RewardStoreActionController.startAction(
        name: '_RewardStore.setUserId');
    try {
      return super.setUserId(userId: userId);
    } finally {
      _$_RewardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle({required String title}) {
    final _$actionInfo = _$_RewardStoreActionController.startAction(
        name: '_RewardStore.setTitle');
    try {
      return super.setTitle(title: title);
    } finally {
      _$_RewardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userId: ${userId},
title: ${title}
    ''';
  }
}
