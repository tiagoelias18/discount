import 'package:discount/origin/calculate_discount.dart';

class CalculateDiscountMock implements CalculateDiscount {
  int callsCalculateDiscount = 0;
  double valueReceived = 0;
  double discountReceived = 0;

  @override
  void calculateDiscount(double value, double discount) {
    callsCalculateDiscount += 1;
    valueReceived = value;
    discountReceived = discount;
  }
}