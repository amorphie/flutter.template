import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:flutter/material.dart';

class BrgTransitionListenerWidget extends StatefulWidget {
  final Widget child;
  final String transitionId;
  final Function(String navigationPath) onPageNavigation;

  const BrgTransitionListenerWidget({
    Key? key,
    required this.child,
    required this.transitionId,
    required this.onPageNavigation,
  }) : super(key: key);

  @override
  State<BrgTransitionListenerWidget> createState() => _BrgTransitionListenerWidgetState();
}

class _BrgTransitionListenerWidgetState extends State<BrgTransitionListenerWidget> {
  late SignalrConnectionManager signalrConnectionManager;

  @override
  void initState() {
    super.initState();
    signalrConnectionManager = SignalrConnectionManager()..init();
    signalrConnectionManager.listenForTransitionEvents(
        transitionId: widget.transitionId, onPageNavigation: widget.onPageNavigation);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    signalrConnectionManager.stop();
    super.dispose();
  }
}
