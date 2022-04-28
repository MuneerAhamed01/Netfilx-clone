import 'package:flutter/material.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Center(
            child: Text(
      "New and hot",
      style: TextStyle(color: Colors.white),
    )));
  }
}
