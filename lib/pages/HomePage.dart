import 'dart:ui';
import 'package:flutter/material.dart';
import '../Constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.redAccent,
            width: double.infinity,
            height: MediaQuery.of(context).devicePixelRatio * 360,
            child: const Center(child: Text('Section 1\n360px', style: Constants.lightTextStyle,
              textAlign: TextAlign.center)),
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: MediaQuery.of(context).devicePixelRatio * 320,
            child: const Center(child: Text('Section 2\n320px', style: Constants.lightTextStyle,
                textAlign: TextAlign.center)),
          ),
          Container(
            color: Colors.green,
            width: double.infinity,
            height: MediaQuery.of(context).devicePixelRatio * 480,
            child: const Center(child: Text('Section 3\n480px', style: Constants.lightTextStyle,
                textAlign: TextAlign.center)),
          ),
        ],
      ),
    );
  }
}
