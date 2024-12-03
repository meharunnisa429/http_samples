import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http_samples/Api/apis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _numberInputController = TextEditingController();

  String _result = "Type Number and get result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Number",
              ),
              controller: _numberInputController,
            ),
            ElevatedButton(
                onPressed: () async {
                  final _number = _numberInputController.text;
                  final result = await getNumberFact(number: _number);
                  log(result.text!);
                  setState(() {
                    _result = result.text??"No Trivia text found";
                  });
                },
                child: Text("Get Result")),
            Text(_result)
          ],
        ),
      ),
    );
  }
}
