import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final String token;
  const HomeView({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$token'),
    );
  }
}
