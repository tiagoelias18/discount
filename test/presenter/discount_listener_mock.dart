import 'package:discount/presenter/discount_listener.dart';

class DiscountListenerMock implements DiscountListener {
  String value = "";
  int callsToReceiveFinalValue = 0;

  @override
  void receiveFinalValue(String price) {
    callsToReceiveFinalValue += 1;
    value = price;
  }
}