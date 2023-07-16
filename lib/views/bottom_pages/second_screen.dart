import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class secondscreen extends StatefulWidget {
  const secondscreen({super.key});

  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {
  @override
  void initState() {
    super.initState();
    getEmail();
  }

  String userEmail = "";
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(userEmail),
    );
  }

  getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString("email") ?? "--";
    setState(() {
      
    });
  }
}
