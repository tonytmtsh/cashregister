import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cash2/register.dart';
import 'package:cash2/style/styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CashRegisterType>(
      builder: (_, myModel, __) {
        return Container(
          color: myModel.error ? Colors.red : Colors.black12,
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('Non-taxable', style: TextStyles.body.bold),
                      Text(myModel.nontaxableTotal, style: TextStyles.body)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('Taxable', style: TextStyles.body.bold),
                      Text(myModel.taxableTotal, style: TextStyles.body)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('Tax', style: TextStyles.body.bold),
                      Text(myModel.taxAmount, style: TextStyles.body)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('Total', style: TextStyles.body.bold),
                      Text(myModel.grandTotal, style: TextStyles.body)
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(myModel.quantity,
                      style: (myModel.quantity.length < 3)
                          ? TextStyles.display
                          : TextStyles.body),
                  Text(myModel.entry,
                      style: (myModel.entry.length < 12)
                          ? TextStyles.display
                          : TextStyles.display2),
                  Text(myModel.taxPercentage),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
