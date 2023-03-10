import 'dart:html';
import 'dart:io';
import 'dart:typed_data';

Future<void> main() async{
  // Create a socket and connect to the server
  const String serverAddress = "0.0.0.0";
  const int serverPort = 3000;

  final socket = await Socket.connect(serverAddress, serverPort);

  print('Client: Connected to: ${socket.remoteAddress.address}:${socket.port}');
  socket.listen((Uint8List data) { 
    final serverResponse = String.fromCharCodes(data);
    print("Cliet $serverResponse");
  },
  onError: (error){
    print("Client: $error");
    socket.destroy();
  },
  onDone: (){
    print("Client: Server disconnected");
    socket.destroy();
  }
  );

  String? username;

  do{
    print("Client: Please enter a username");
  }while(username == null || username.isEmpty);

  socket.write(username);
}

