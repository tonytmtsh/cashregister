import 'package:flutter/material.dart';
import 'package:cash2/register.dart';
import 'package:provider/provider.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({Key? key, required this.keyValue}) : super(key: key);

  final int keyValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.lightGreen,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        child: Text(keyValue.toString()),
        onPressed: () {
          CashRegisterType myModel =
              Provider.of<CashRegisterType>(context, listen: false);
          myModel.addEntry(keyValue);
        },
      ),
    );
  }
}
