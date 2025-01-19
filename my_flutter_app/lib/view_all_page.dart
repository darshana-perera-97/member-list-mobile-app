import 'package:flutter/material.dart';

class ViewAllPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Page'),
      ),
      body: Center(
        child: Text(
          'This is the View All Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
