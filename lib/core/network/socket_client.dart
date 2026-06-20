import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SocketClient {
  static final SocketClient _instance = SocketClient._internal();
  IO.Socket? _socket;

  factory SocketClient() {
    return _instance;
  }

  SocketClient._internal();

  IO.Socket? get socket => _socket;

  Future<void> connect() async {
    if (_socket != null && _socket!.connected) return;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    
    final token = await user.getIdToken();

    _socket = IO.io(
      'http://10.0.2.2:3000', // Adapt for real device vs emulator (localhost / 10.0.2.2)
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setAuth({'token': token})
          .build(),
    );

    _socket!.connect();

    _socket!.onConnect((_) {
      print('Socket connected: ${_socket!.id}');
    });

    _socket!.onDisconnect((_) {
      print('Socket disconnected');
    });
  }

  void joinSosRoom(String sosId) {
    _socket?.emit('joinSosRoom', sosId);
  }

  void disconnect() {
    _socket?.disconnect();
    _socket = null;
  }
}
