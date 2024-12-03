
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http_samples/package/api_service.dart';

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
                child: const Text("Get Result")),
            Text(_result)
          ],
        ),
      ),
    );
  }
}
