import 'package:discount/interactor/discount_interactor_receiver.dart';
import 'package:discount/origin/calculate_discount.dart';

class CalculateDiscountFailureMock implements CalculateDiscount {
  final DiscountInteractorReceiver _receiver;

  CalculateDiscountFailureMock(this._receiver);

  @override
  void calculateDiscount(double value, double discount) {
    _receiver.receiveFinalValueError("failure");
  }
}