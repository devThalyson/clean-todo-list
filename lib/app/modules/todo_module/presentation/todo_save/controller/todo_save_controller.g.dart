// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_save_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoSaveController on _TodoSaveControllerBase, Store {
  final _$behaviourAtom = Atom(name: '_TodoSaveControllerBase.behaviour');

  @override
  Behaviour get behaviour {
    _$behaviourAtom.reportRead();
    return super.behaviour;
  }

  @override
  set behaviour(Behaviour value) {
    _$behaviourAtom.reportWrite(value, super.behaviour, () {
      super.behaviour = value;
    });
  }

  final _$saveTodoAsyncAction = AsyncAction('_TodoSaveControllerBase.saveTodo');

  @override
  Future saveTodo(BuildContext context) {
    return _$saveTodoAsyncAction.run(() => super.saveTodo(context));
  }

  @override
  String toString() {
    return '''
behaviour: ${behaviour}
    ''';
  }
}
