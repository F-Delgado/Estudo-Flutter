import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red,
          ).copyWith(
            secondary: Colors.black26,
          ),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueGrey,
              textTheme: ButtonTextTheme.primary)),
      home: ListaTransferencia(),
    );
  }
}
