// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FoodStore on _FoodStore, Store {
  late final _$uploadedImageLinkAtom =
      Atom(name: '_FoodStore.uploadedImageLink', context: context);

  @override
  String? get uploadedImageLink {
    _$uploadedImageLinkAtom.reportRead();
    return super.uploadedImageLink;
  }

  @override
  set uploadedImageLink(String? value) {
    _$uploadedImageLinkAtom.reportWrite(value, super.uploadedImageLink, () {
      super.uploadedImageLink = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: '_FoodStore.selectedDate', context: context);

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$initialDateAtom =
      Atom(name: '_FoodStore.initialDate', context: context);

  @override
  DateTime get initialDate {
    _$initialDateAtom.reportRead();
    return super.initialDate;
  }

  @override
  set initialDate(DateTime value) {
    _$initialDateAtom.reportWrite(value, super.initialDate, () {
      super.initialDate = value;
    });
  }

  late final _$_FoodStoreActionController =
      ActionController(name: '_FoodStore', context: context);

  @override
  void setUploadedImageLink({String? uploadedImageLink}) {
    final _$actionInfo = _$_FoodStoreActionController.startAction(
        name: '_FoodStore.setUploadedImageLink');
    try {
      return super.setUploadedImageLink(uploadedImageLink: uploadedImageLink);
    } finally {
      _$_FoodStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedDate({required DateTime selectedDate}) {
    final _$actionInfo = _$_FoodStoreActionController.startAction(
        name: '_FoodStore.setSelectedDate');
    try {
      return super.setSelectedDate(selectedDate: selectedDate);
    } finally {
      _$_FoodStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uploadedImageLink: ${uploadedImageLink},
selectedDate: ${selectedDate},
initialDate: ${initialDate}
    ''';
  }
}
