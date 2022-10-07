import 'package:discount/interactor/discount_interactor_provider.dart';
import 'package:discount/interactor/discount_interactor_receiver.dart';
import 'package:discount/origin/calculate_discount.dart';
import 'package:discount/origin/calculator_discount.dart';
import 'package:discount/presenter/discount_listener.dart';

class DiscountInteractor
    implements DiscountInteractorProvider, DiscountInteractorReceiver {
  DiscountListener _listener;
  CalculateDiscount _origin;

  DiscountInteractor(this._listener, {CalculateDiscount origin}) {
    _origin = origin ?? CalculatorDiscount(this);
  }

  @override
  void obtainFinalValue(String value, String discount) {
    _origin.calculateDiscount(
        double.tryParse(value ?? null), double.tryParse(discount ?? null));
  }

  @override
  void receiveFinalValue(double value) {
    _listener.receiveFinalValue("O valor final é " + value.toStringAsFixed(2));
  }

  @override
  void receiveFinalValueError(String error) {
    _listener.receiveFinalValue(error);
  }
}
