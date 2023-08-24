import 'dart:convert';

import 'package:burgankuwait/core/util/app_constants.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SignalrConnectionManager {
  final String serverUrl;
  final String methodName;
  late HubConnection _hubConnection;
  final Function(String navigationPath)? onPageNavigation;

  SignalrConnectionManager({
    this.serverUrl = AppConstants.workflowHubUrl,
    this.methodName = "SendMessage",
    this.onPageNavigation,
  });

  Future<void> init() async {
    _hubConnection = HubConnectionBuilder()
        .withUrl(serverUrl)
        .withAutomaticReconnect(retryDelays: [2000, 5000, 10000, 20000]).build();
    _hubConnection.onclose(({error}) => print('onclose called'));
    _hubConnection.onreconnecting(({error}) => print("onreconnecting called"));
    _hubConnection.onreconnected(({connectionId}) => print("onreconnected called"));
    _hubConnection.on(methodName, _handleIncomingNavigation);

    if (_hubConnection.state != HubConnectionState.Connected) {
      await _hubConnection.start();
    }
  }

  void _handleIncomingNavigation(List<Object?>? args) {
    if (onPageNavigation == null) {
      return;
    }
    final isNavigationAllowed = (jsonDecode(args?[0]?.toString() ?? "")?["page"])?["operation"] == "Open";
    final navigationPath = (jsonDecode(args?[0]?.toString() ?? "")?["page"])?["pageRoute"]?["label"] as String?;
    if (isNavigationAllowed && navigationPath != null) {
      onPageNavigation!(navigationPath);
    }
  }
}
