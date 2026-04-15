import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

Future<String> getAdviceFromJson(BuildContext context) async {
  final String response = await rootBundle.loadString('assets/data/advice.json');
  final List<dynamic> data = json.decode(response);

  int dayOfYear = DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays;
  int index = dayOfYear % data.length;

  String langCode = Localizations.localeOf(context).languageCode;

  return data[index][langCode];
}