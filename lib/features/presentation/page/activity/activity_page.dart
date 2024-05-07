
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/consts.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title:const Text("Activity", style: TextStyle(color: primaryColor),),
      ),
    );
  }
}
