import 'package:discount/origin/calculate_discount.dart';
import 'package:discount/origin/calculator_discount.dart';
import 'package:flutter_test/flutter_test.dart';
import '../interactor/discount_interactor_receiver_mock.dart';

main() {
  group('Calculate origin', () {
    CalculateDiscount _discountOrigin;
    DiscountInteractorReceiverMock _receiverMock;

    setUp(() {
      _receiverMock = DiscountInteractorReceiverMock();
      _discountOrigin = CalculatorDiscount(_receiverMock);
    });
    test('Calculate error values entries', () {
      _discountOrigin.calculateDiscount(null, null);
      expect(_receiverMock.callsToReceiveFinalValueError, 1);
      expect(_receiverMock.errorReceived,
          "Os dois valores devem estar digitados corretamente");
    });
    test('Calculate discount higher than price ', () {
      _discountOrigin.calculateDiscount(10, 20);
      expect(_receiverMock.callsToReceiveFinalValueError, 1);
      expect(_receiverMock.errorReceived,
          "O desconto não pode ser maior do que o valor inicial");
    });

    test('Calculate discount', () {
      _discountOrigin.calculateDiscount(30, 20);
      expect(_receiverMock.callsToReceiveFinalValue, 1);
      expect(_receiverMock.valueReceived, 10);
    });
  });
}
