import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:math';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  NextPageState createState() => NextPageState();
}

// At first glance it might look like we are just generating a random number
// then printing the number. But, its not the case here, I coundn't find a free websocket
// that would send a new random real-time data anytime we want.
// Here, a service from echo.websocket.org is used which basically return the same data that we send
// it in the first place. So,
// 1. we are establishing a connection with the websocket
// 2. generating the random number
// 3. sending it to the websocket
// 4. receiving the same data from the websocket (line 41 to 48, no interaction between the variable
//    receiveddata and the randomnumber)
// 5. printing the value of the variable that is storing the RECEIVED data from the websocket.

class NextPageState extends State<NextPage> {
  final WebSocketChannel _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.org'), // Establish WebSocket connection
  );

  // ignore: unused_field
  int? _randomNumber;
  String _receivedData = '000'; // for storing the data after receiving

  void generateAndDataTransfer() {
    final random = Random();
    final int randomNumber =
        random.nextInt(1000); // Generates a number from 0 to 999

    setState(() {
      _randomNumber = randomNumber;
    });

    _channel.sink.add(
        _randomNumber.toString()); // Send the random number to the WebSocket
    //print('Sent Random Number: $randomNumber');

    _channel.stream.listen((data) {
      setState(() {
        _receivedData = data;
      });
    });
  }

  @override
  void dispose() {
    _channel.sink.close(); // Close the WebSocket connection
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 111, 177, 234),
      appBar: AppBar(
        title: const Center(
          child: Text('Test WebSocket'),
        ),
        backgroundColor: const Color.fromARGB(255, 111, 177, 234),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_receivedData', // Display the received data
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Add space inbetween
            ElevatedButton(
              onPressed: generateAndDataTransfer,
              child: const Text('Print'),
            ),
          ],
        ),
      ),
    );
  }
}
