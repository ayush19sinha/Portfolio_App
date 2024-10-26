class Investment {
  final String id;
  final String name;
  final double amountInvested;
  final double currentValue;

  Investment({
    required this.id,
    required this.name,
    required this.amountInvested,
    required this.currentValue,
  });

  double get growthPercentage {
    return ((currentValue - amountInvested) / amountInvested * 100);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amountInvested': amountInvested,
      'currentValue': currentValue,
    };
  }

  factory Investment.fromJson(Map<String, dynamic> json) {
    return Investment(
      id: json['id'],
      name: json['name'],
      amountInvested: json['amountInvested'],
      currentValue: json['currentValue'],
    );
  }
}