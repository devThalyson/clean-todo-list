import 'package:clean_todo_list/app/shared/core/behaviour/behaviour.dart';
import 'package:flutter/material.dart';

class BuilderStateWidget extends StatefulWidget {
  final Behaviour behaviour;
  final Widget Function(BuildContext context) regular;
  final Widget Function(BuildContext context)? loading;
  final Widget Function(BuildContext context)? error;

  const BuilderStateWidget({
    required this.behaviour,
    required this.regular,
    this.loading,
    this.error,
  });

  @override
  _BuilderStateWidgetState createState() => _BuilderStateWidgetState();
}

class _BuilderStateWidgetState extends State<BuilderStateWidget> {
  Widget Function(BuildContext context) stateBuilder() {
    switch (widget.behaviour) {
      case Behaviour.regular:
        return widget.regular;
      case Behaviour.loading:
        return widget.loading!;
      case Behaviour.error:
        return widget.error!;
      default:
        return widget.regular;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: stateBuilder(),
    );
  }
}
