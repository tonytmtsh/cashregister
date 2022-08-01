import 'package:shared_preferences/shared_preferences.dart';

class SavedPreferencesService {
  static const String _taxRate = "taxRate";

  static Future<double> getTaxRate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getDouble(_taxRate) ?? 0.00;
  }

  static Future<bool> setTaxRate(double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setDouble(_taxRate, value);
  }
}
