import 'package:flutter/material.dart';
import 'package:cash2/register.dart';
import 'package:provider/provider.dart';

class CommandButton extends StatelessWidget {
  const CommandButton({Key key, this.command}) : super(key: key);
  final RegisterCommands command;

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<CashRegisterType>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RaisedButton(
        color: command == RegisterCommands.reset
            ? Colors.pink
            : command == RegisterCommands.clear
                ? Colors.orange
                : command == RegisterCommands.addNonTaxible
                    ? Colors.yellow
                    : Colors.lightBlue,
        child: Text(commandText(command)),
        onPressed: () {
          switch (command) {
            case RegisterCommands.reset:
              myModel.reset();
              break;
            case RegisterCommands.clear:
              myModel.clear();
              break;
            case RegisterCommands.addNonTaxible:
              myModel.addNonTaxible();
              break;
            case RegisterCommands.addTaxible:
              myModel.addTaxible();
              break;
            case RegisterCommands.quantity:
              myModel.updateQuantity();
          }
        },
      ),
    );
  }
}
