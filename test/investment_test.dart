
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_app/models/investment.dart';

void main() {
  group('Investment', () {
    test('calculates growth percentage correctly', () {
      final investment = Investment(
        id: '1',
        name: 'Test Investment',
        amountInvested: 1000,
        currentValue: 1200,
      );

      expect(investment.growthPercentage, 20.0);
    });

    test('handles negative growth percentage', () {
      final investment = Investment(
        id: '1',
        name: 'Test Investment',
        amountInvested: 1000,
        currentValue: 800,
      );

      expect(investment.growthPercentage, -20.0);
    });
  });
}