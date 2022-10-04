import 'package:flutter/material.dart';

final kTextFieldDecoration = InputDecoration(
  hintText: 'Enter the hintText',
  hintStyle: TextStyle(
    color: Colors.black.withOpacity(0.32),
    fontSize: 12,
    fontWeight: FontWeight.bold,
  ),
  fillColor: Colors.black,

  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      width: 1.0,
      color: Color(0xff333333),
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      width: 2.0,
      color: Colors.black,
    ),
  ),
);