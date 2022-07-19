import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cash2/register.dart';
import 'package:cash2/Style/styles.dart';

class RegisterTape extends StatelessWidget {
  const RegisterTape({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CashRegisterType>(builder: (context, myModel, child) {
      return Expanded(
          child: ListView.builder(
        controller: myModel.scrollController,
        reverse: true,
        itemCount: myModel.tape.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              dense: true,
              leading: Text('${myModel.tape.length - i}'),
              title: Text(myModel.tape[i].displayEach,
                  style: TextStyles.body.bold),
              trailing:
                  Text(myModel.tape[i].displayAmount, style: TextStyles.body),
            ),
          );
        },
      ));
    });
  }
}
