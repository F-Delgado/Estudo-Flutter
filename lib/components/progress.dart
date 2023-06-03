import 'package:flutter/material.dart';

class Progress extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          Text('Loading'),
        ],
      ),
    );
  }
}