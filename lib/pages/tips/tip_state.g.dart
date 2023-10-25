// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TipStore on _TipStore, Store {
  late final _$tipsListAtom =
      Atom(name: '_TipStore.tipsList', context: context);

  @override
  List<TipItem> get tipsList {
    _$tipsListAtom.reportRead();
    return super.tipsList;
  }

  @override
  set tipsList(List<TipItem> value) {
    _$tipsListAtom.reportWrite(value, super.tipsList, () {
      super.tipsList = value;
    });
  }

  late final _$noOfReadsAtom =
      Atom(name: '_TipStore.noOfReads', context: context);

  @override
  int get noOfReads {
    _$noOfReadsAtom.reportRead();
    return super.noOfReads;
  }

  @override
  set noOfReads(int value) {
    _$noOfReadsAtom.reportWrite(value, super.noOfReads, () {
      super.noOfReads = value;
    });
  }

  late final _$_TipStoreActionController =
      ActionController(name: '_TipStore', context: context);

  @override
  void setTipReader(
      {required bool isRead, required int tipId, required int stepId}) {
    final _$actionInfo =
        _$_TipStoreActionController.startAction(name: '_TipStore.setTipReader');
    try {
      return super.setTipReader(isRead: isRead, tipId: tipId, stepId: stepId);
    } finally {
      _$_TipStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNoOfReads({required int noOfReads}) {
    final _$actionInfo =
        _$_TipStoreActionController.startAction(name: '_TipStore.setNoOfReads');
    try {
      return super.setNoOfReads(noOfReads: noOfReads);
    } finally {
      _$_TipStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipsList: ${tipsList},
noOfReads: ${noOfReads}
    ''';
  }
}
