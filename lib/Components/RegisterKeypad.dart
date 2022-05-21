import 'package:flutter/material.dart';
import 'package:cash2/register.dart';
import 'package:cash2/Components/NumberButton.dart';
import 'package:cash2/Components/CommandButton.dart';

class RegisterKeypad extends StatelessWidget {
  const RegisterKeypad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(keyValue: 7),
                NumberButton(keyValue: 8),
                NumberButton(keyValue: 9),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(keyValue: 4),
                NumberButton(keyValue: 5),
                NumberButton(keyValue: 6),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(keyValue: 1),
                NumberButton(keyValue: 2),
                NumberButton(keyValue: 3),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CommandButton(command: RegisterCommands.quantity),
                NumberButton(keyValue: 0),
                Container(width: 90)
              ],
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CommandButton(command: RegisterCommands.reset),
              CommandButton(command: RegisterCommands.clear),
              CommandButton(command: RegisterCommands.addNonTaxible),
              CommandButton(command: RegisterCommands.addTaxible),
            ],
          ),
        ),
      ],
    );
  }
}
