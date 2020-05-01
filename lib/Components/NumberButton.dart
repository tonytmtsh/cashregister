import 'package:flutter/material.dart';
import 'package:cash2/register.dart';
import 'package:provider/provider.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({Key key, this.keyValue}) : super(key: key);

  final int keyValue;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RaisedButton(
        color: Colors.lightGreen,
        child: Text(keyValue.toString()),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        onPressed: () {
          CashRegisterType myModel = Provider.of<CashRegisterType>(context, listen: false);
          myModel.addEntry(keyValue);
        },
      ),
    );
  }
}
