import 'package:flutter/material.dart';
import 'package:cash2/register.dart';
import 'package:provider/provider.dart';
import 'package:cash2/Components/register_keypad.dart';
import 'package:cash2/Components/register_screen.dart';
import 'package:cash2/Components/register_tape.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CashRegisterType>(
      create: (context) => CashRegisterType(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cash Register',
        home: Scaffold(
          appBar: AppBar(
              title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text('Cash Register'),
              Icon(Icons.monetization_on),
            ],
          )),
          body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: const <Widget>[
                RegisterTape(),
                RegisterScreen(),
                RegisterKeypad(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
