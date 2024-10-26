import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/investment.dart';
import '../providers/investment_provider.dart';

class InvestmentDetailsScreen extends StatelessWidget {
  final Investment investment;

  const InvestmentDetailsScreen({
    super.key,
    required this.investment,
  });

  void _showDeleteConfirmation(BuildContext context) {
    bool isDeleting = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Delete Investment'),
              content: Text('Are you sure you want to delete ${investment.name}?'),
              actions: [
                TextButton(
                  onPressed: isDeleting
                      ? null
                      : () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: isDeleting
                      ? null
                      : () async {
                    setState(() => isDeleting = true);

                    await Provider.of<InvestmentProvider>(context, listen: false)
                        .deleteInvestment(investment.id);

                    if (context.mounted) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${investment.name} has been deleted'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.error,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isDeleting)
                        Container(
                          width: 16,
                          height: 16,
                          margin: const EdgeInsets.only(right: 8),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      const Text('Delete'),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(investment.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            color: theme.colorScheme.error,
            onPressed: () => _showDeleteConfirmation(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      DetailRow(
                        label: 'Investment Name',
                        value: investment.name,
                      ),
                      const SizedBox(height: 8),
                      DetailRow(
                        label: 'Amount Invested',
                        value: '\$${investment.amountInvested.toStringAsFixed(2)}',
                      ),
                      const SizedBox(height: 8),
                      DetailRow(
                        label: 'Current Value',
                        value: '\$${investment.currentValue.toStringAsFixed(2)}',
                      ),
                      const SizedBox(height: 8),
                      DetailRow(
                        label: 'Growth',
                        value: '${investment.growthPercentage.toStringAsFixed(2)}%',
                        valueColor: investment.growthPercentage >= 0
                            ? Colors.green
                            : Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildPerformanceIndicators(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPerformanceIndicators() {
    final gainLoss = investment.currentValue - investment.amountInvested;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Performance Metrics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            DetailRow(
              label: 'Total Gain/Loss',
              value: '\$${gainLoss.toStringAsFixed(2)}',
              valueColor: gainLoss >= 0
                  ? Colors.green
                  : Colors.red,
            ),
            const SizedBox(height: 8),
            DetailRow(
              label: 'Return on Investment',
              value: '${(investment.growthPercentage).toStringAsFixed(2)}%',
              valueColor: investment.growthPercentage >= 0
                  ? Colors.green
                  : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: valueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
