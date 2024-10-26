import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/investment.dart';
import 'dart:convert';

class InvestmentProvider with ChangeNotifier {
  List<Investment> _investments = [];
  final SharedPreferences prefs;

  InvestmentProvider(this.prefs) {
    _loadInvestments();
  }

  List<Investment> get investments => _investments;

  double get totalPortfolioValue {
    return _investments.fold(0, (sum, investment) => sum + investment.currentValue);
  }

  void _loadInvestments() {
    final investmentsJson = prefs.getStringList('investments') ?? [];
    _investments = investmentsJson
        .map((json) => Investment.fromJson(jsonDecode(json)))
        .toList();
    notifyListeners();
  }

  Future<void> addInvestment(Investment investment) async {
    _investments.add(investment);
    await _saveInvestments();
    notifyListeners();
  }

  Future<void> deleteInvestment(String id) async {
    _investments.removeWhere((investment) => investment.id == id);
    await _saveInvestments();
    notifyListeners();
  }

  Future<void> _saveInvestments() async {
    final investmentsJson = _investments
        .map((investment) => jsonEncode(investment.toJson()))
        .toList();
    await prefs.setStringList('investments', investmentsJson);
  }
}