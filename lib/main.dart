import 'package:flutter/material.dart';
import 'package:flutter_test_app/pages/nextpage.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 111, 177, 234),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Test App",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 97, 66, 156),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 97, 66, 156),
          ),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                //print('Button pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage()),
                );
              },
              child: Text('Test websocket!'),
            ),
          ),
        ),
      ),
    );
  }
}
