import 'package:discount/interactor/discount_interactor.dart';
import 'package:flutter_test/flutter_test.dart';
import '../origin/calculate_origin_mock.dart';
import '../presenter/discount_listener_mock.dart';

main() {
  group('Discount interactor', () {
    DiscountInteractor _discountInteractor;
    CalculateDiscountMock _discountOrigin;
    DiscountListenerMock _discountListener;

    setUp(() {
      _discountListener = DiscountListenerMock();
      _discountOrigin = CalculateDiscountMock();
      _discountInteractor =
          DiscountInteractor(_discountListener, origin: _discountOrigin);
    });
    test('Obtain final value - double values', () {
      _discountInteractor.obtainFinalValue("20", "10");
      expect(_discountOrigin.callsCalculateDiscount, 1);
      expect(_discountOrigin.valueReceived, 20);
      expect(_discountOrigin.discountReceived, 10);
    });

    test('Obtain final value - error values', () {
      _discountInteractor.obtainFinalValue("ab", "");
      expect(_discountOrigin.callsCalculateDiscount, 1);
      expect(_discountOrigin.valueReceived, null);
      expect(_discountOrigin.discountReceived, null);
    });

    test('Receive final value success', () {
      _discountInteractor.receiveFinalValue(10);
      expect(_discountListener.callsToReceiveFinalValue, 1);
      expect(_discountListener.value, 'O valor final é 10.00');
    });

    test('Receive final value failure', () {
      _discountInteractor.receiveFinalValueError('failure');
      expect(_discountListener.callsToReceiveFinalValue, 1);
      expect(_discountListener.value, 'failure');
    });
  });
}
