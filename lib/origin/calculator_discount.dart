import 'package:discount/interactor/discount_interactor_receiver.dart';
import 'package:discount/origin/calculate_discount.dart';

class CalculatorDiscount implements CalculateDiscount {
  DiscountInteractorReceiver _receiver;

  CalculatorDiscount(this._receiver);

  @override
  void calculateDiscount(double value, double discount) {
    if(value == null || discount == null){
      _receiver.receiveFinalValueError("Os dois valores devem estar digitados corretamente");
      return;
    }
    if(value < discount){
      _receiver.receiveFinalValueError("O desconto não pode ser maior do que o valor inicial");
      return;
    }
    _receiver.receiveFinalValue(value - discount);
  }
}