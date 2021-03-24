import 'package:flutter/material.dart';
import 'package:signalr_client/http_connection_options.dart';
import 'package:signalr_client/hub_connection_builder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String serverUrl = 'https://crm.kmkchemicals.com/notificationHub';
  @override
  void initState() {
    hub();
    super.initState();
  }

  hub() async {
    final hubConnection = HubConnectionBuilder()
        .withUrl(serverUrl,
            options: HttpConnectionOptions(
                accessTokenFactory: () async =>
                    await "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIwODE3MWU1YS1lMTFlLTQ2OWUtOGI3OS0xNWNjNjI4MTdkMzMiLCJ1bmlxdWVfbmFtZSI6InN5c3RlbWFkbWluQGttay5jb20iLCJVc2VyVHlwZSI6IlN5c3RlbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlN1cGVyQWRtaW4iLCJSb2xlIjoiU3VwZXJBZG1pbiIsImV4cCI6MTYxNjcxNTQ2NCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NTE3NTAiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo1MTc1MCJ9.qM5B_RDyq1Gv6JE1M3-ktVmcS9KDYf8f8WUBozcUeY4IBUOVls2_TTdawKDs5LMilC2VonVJCG2Zpz0BdOtXOw"))
        .build();
    hubConnection.onclose((error) => print('connection close'));
    hubConnection.on("BroadcastMessage", _handleAClientProvidedFunction);
    // await hubConnection.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('signalR'),
      ),
    );
  }

  void _handleAClientProvidedFunction(List<Object> arguments) {
    print('hhh');
  }
}
