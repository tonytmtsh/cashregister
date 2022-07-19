import 'package:flutter/material.dart';
import 'package:cash2/register.dart';
import 'package:cash2/Components/number_button.dart';
import 'package:cash2/Components/command_button.dart';

class RegisterKeypad extends StatelessWidget {
  const RegisterKeypad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    NumberButton(keyValue: 7),
                    NumberButton(keyValue: 8),
                    NumberButton(keyValue: 9),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    NumberButton(keyValue: 4),
                    NumberButton(keyValue: 5),
                    NumberButton(keyValue: 6),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    NumberButton(keyValue: 1),
                    NumberButton(keyValue: 2),
                    NumberButton(keyValue: 3),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    CommandButton(command: RegisterCommands.quantity),
                    NumberButton(keyValue: 0),
                  ],
                ),
              ],
            )),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const <Widget>[
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
