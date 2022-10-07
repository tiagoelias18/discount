import 'package:discount/interactor/discount_interactor_receiver.dart';
import 'package:discount/origin/calculate_discount.dart';

class CalculateDiscountSuccessMock implements CalculateDiscount {
  final DiscountInteractorReceiver _receiver;

  CalculateDiscountSuccessMock(this._receiver);

  @override
  void calculateDiscount(double value, double discount) {
    _receiver.receiveFinalValue(value - discount);
  }
}