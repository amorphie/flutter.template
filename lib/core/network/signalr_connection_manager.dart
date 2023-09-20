import 'dart:convert';

import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:burgankuwait/core/widgets/brg_transition_listener/models/brg_signalr_transition.dart';
import 'package:collection/collection.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SignalrConnectionManager {
  final String serverUrl;
  final String methodName;
  late HubConnection _hubConnection;

  SignalrConnectionManager({
    this.serverUrl = AppConstants.workflowHubUrl,
    this.methodName = "SendMessage",
  });

  Future<void> init({Function(String navigationPath)? onPageNavigation}) async {
    _hubConnection = HubConnectionBuilder()
        .withUrl(serverUrl)
        .withAutomaticReconnect(retryDelays: [2000, 5000, 10000, 20000]).build();
    _hubConnection.onclose(({error}) => print('onclose called'));
    _hubConnection.onreconnecting(({error}) => print("onreconnecting called"));
    _hubConnection.onreconnected(({connectionId}) => print("onreconnected called"));

    if (_hubConnection.state != HubConnectionState.Connected) {
      await _hubConnection.start();
    }
  }

  void listenForTransitionEvents({
    required String transitionId,
    required Function(String navigationPath) onPageNavigation,
    Function(String errorMessage)? onError,
  }) {
    _hubConnection.on(methodName, (List<Object?>? transitions) {
      if (transitions == null) {
        return;
      }
      final ongoingTransition = transitions
          .map((transition) {
            try {
              return BrgSignalRTransition.fromJson(jsonDecode(transition as String));
            } catch (e) {
              return null;
            }
          })
          .where((element) => element != null)
          .toList()
          .firstWhereOrNull((transition) => transition?.transitionId == transitionId);

      final isNavigationAllowed = ongoingTransition?.pageDetails["operation"] == "Open";
      final navigationPath = ongoingTransition?.pageDetails["pageRoute"]?["label"] as String?;
      if (isNavigationAllowed && navigationPath != null) {
        onPageNavigation(navigationPath);
      } else if ((ongoingTransition?.errorMessage.isNotEmpty ?? false) && onError != null) {
        onError(ongoingTransition!.errorMessage);
      }
    });
  }

  void stop() {
    _hubConnection.stop();
  }
}
