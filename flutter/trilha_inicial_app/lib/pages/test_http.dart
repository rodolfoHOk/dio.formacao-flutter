import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestHTTPPage extends StatefulWidget {
  const TestHTTPPage({super.key});

  @override
  State<TestHTTPPage> createState() => _TestHTTPPageState();
}

class _TestHTTPPageState extends State<TestHTTPPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: const Center(
              child: Text("HTTP Teste",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // debugPrint('Antes de chamada');
            // http.get(Uri.parse('https://google.com')).then((value) {
            //   debugPrint('Durante a chamada');
            // });
            // debugPrint('Depois de chamada 1');
            // debugPrint('Depois de chamada 2');
            // debugPrint('Depois de chamada 3');
            debugPrint('Antes de chamada');
            var response =
                await http.get(Uri.parse('https://google.com/nao-existe'));
            debugPrint('Depois de chamada');
            debugPrint(response.statusCode.toString());
            // debugPrint(response.body);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
