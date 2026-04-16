import 'package:flutter/material.dart';

class MedicationEntry {
  TextEditingController controller;
  TimeOfDay? time;
  int? interval;

  MedicationEntry({required this.controller, this.time, this.interval});
}