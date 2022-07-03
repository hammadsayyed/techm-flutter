import 'package:flutter/material.dart';
import 'dart:ui';

class Constants {
  static const TextStyle lightTextStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );

  static const TextStyle darkTextStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );

  static const TextStyle smallTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );

  static const String baseUrl = 'http://3.109.153.25:8090/';
  static const String videos = 'cms/videos?page=1&amp;size=10';
}