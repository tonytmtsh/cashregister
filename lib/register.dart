import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cash2/services/savedprefs.dart';

enum RegisterCommands {
  reset,
  clear,
  addTaxible,
  addNonTaxible,
  quantity,
  setTax
}

final currency = NumberFormat.simpleCurrency(locale: "en_US");
final numbers = NumberFormat('#,##0');
final precentage = NumberFormat('#,##0.00%');

String commandText(RegisterCommands x) {
  String text = "";
  switch (x) {
    case RegisterCommands.reset:
      text = "reset";
      break;
    case RegisterCommands.clear:
      text = "clear";
      break;
    case RegisterCommands.addNonTaxible:
      text = "add non-tax";
      break;
    case RegisterCommands.addTaxible:
      text = "add taxible";
      break;
    case RegisterCommands.quantity:
      text = "@";
      break;
    case RegisterCommands.setTax:
      text = "set tax rate";
  }
  return text;
}

class Tape {
  bool isTaxable;
  int quantity;
  double amount;

  Tape(this.isTaxable, this.quantity, this.amount);

  String get displayEach =>
      '${numbers.format(quantity)}${isTaxable ? ' taxable' : ''} @ ${currency.format(amount)}';
  String get displayAmount => currency.format(amount * quantity);
}

class CashRegisterType with ChangeNotifier {
  double _entry = 0.00;
  double _taxableTotal = 0.00;
  double _nontaxableTotal = 0.00;
  int _quantity = 1;
  double? _taxRate;

  bool error = false;

  ScrollController scrollController = ScrollController();

  List<Tape> tape = <Tape>[];

  CashRegisterType() {
    loadTax();
  }

  double get taxRate {
    return _taxRate ?? 0.00;
  }

  String get taxPercentage => precentage.format(_taxRate ?? 0.00);

  String get entry => currency.format(_entry);
  String get quantity => '$_quantity@';
  String get taxableTotal => currency.format(_taxableTotal);
  String get nontaxableTotal => currency.format(_nontaxableTotal);
  String get taxAmount => currency.format(tax());
  String get grandTotal =>
      currency.format(_taxableTotal + tax() + _nontaxableTotal);

  double tax() {
    return double.parse(
        (_taxableTotal * (_taxRate ?? 0.00)).toStringAsFixed(2));
  }

  void setTaxRate() {
    _taxRate = _entry / 100.00;
    updateTax();
    clear();
  }

  void addEntry(int keyValue) {
    if (entry.length < 14) {
      _entry = (_entry * 10) + (keyValue / 100);
      error = false;
    } else {
      error = true;
    }
    notifyListeners();
  }

  void clear() {
    debugPrint('clear');
    _entry = 0.00;
    _quantity = 1;
    error = false;
    if (scrollController.hasClients) {
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 900), curve: Curves.bounceOut);
    }
    notifyListeners();
  }

  void reset() {
    debugPrint('reset');
    _taxableTotal = 0.00;
    _nontaxableTotal = 0.00;
    tape.clear();
    clear();
  }

  void addTaxible() {
    debugPrint('addTaxible');
    _taxableTotal = _taxableTotal + (_entry * _quantity);
    tape.insert(0, Tape(true, _quantity, _entry));
    clear();
  }

  void addNonTaxible() {
    debugPrint('addNonTaxible');
    _nontaxableTotal = _nontaxableTotal + (_entry * _quantity);
    tape.insert(0, Tape(false, _quantity, _entry));
    clear();
  }

  void updateQuantity() {
    debugPrint('quantity');
    _quantity = int.parse((_entry * 100.0).toStringAsFixed(0));
    _entry = 0.00;
    notifyListeners();
  }

  void loadTax() {
    debugPrint('loadTax');
    SavedPreferencesService.getTaxRate().then((value) => {_taxRate = value});
  }

  void updateTax() {
    debugPrint('updateTax');
    SavedPreferencesService.setTaxRate(_taxRate ?? 0.00);
  }
}
