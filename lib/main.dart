import 'package:flutter/material.dart';
import 'package:cash2/register.dart';
import 'package:provider/provider.dart';
import 'package:cash2/Components/RegisterKeypad.dart';
import 'package:cash2/Components/RegisterScreen.dart';
import 'package:cash2/Components/RegisterTape.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
            children: <Widget>[
              Text('Cash Register'),
              Icon(Icons.monetization_on),
            ],
          )),
          body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
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
