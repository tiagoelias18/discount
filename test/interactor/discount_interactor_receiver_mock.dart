import 'package:discount/interactor/discount_interactor_receiver.dart';

class DiscountInteractorReceiverMock implements DiscountInteractorReceiver {
  int callsToReceiveFinalValue = 0;
  int callsToReceiveFinalValueError = 0;
  double valueReceived = 0;
  String errorReceived = "";

  @override
  void receiveFinalValue(double value) {
    callsToReceiveFinalValue += 1;
    valueReceived = value;
  }

  @override
  void receiveFinalValueError(String error) {
    callsToReceiveFinalValueError += 1;
    errorReceived = error;
  }
}
