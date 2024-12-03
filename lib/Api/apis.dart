import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http_samples/number_fact_response/number_fact_response.dart';

Future<NumberFactResponse> getNumberFact({required String number}) async {
  final _reponse =
      await http.get(Uri.parse('http://numbersapi.com/$number?json'));

  final bodyAsJson = jsonDecode(_reponse.body) as Map<String, dynamic>;
  final data = NumberFactResponse.fromJson(bodyAsJson);
  return data;
}
