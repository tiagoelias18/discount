import 'package:discount/interactor/discount_interactor.dart';
import 'package:discount/origin/calculate_discount.dart';
import 'package:flutter_test/flutter_test.dart';
import '../origin/calculate_discount_failure_mock.dart';
import '../origin/calculte_discount_success_mock.dart';
import '../presenter/discount_listener_mock.dart';
import 'discount_interactor_receiver_mock.dart';

main() {
  group('Discount interactor', () {
    DiscountInteractor _discountInteractor;
    CalculateDiscount _discountOrigin;
    DiscountListenerMock _discountListener;
    DiscountInteractorReceiverMock _interactorReceiver;

    setUp(() {
      _interactorReceiver = DiscountInteractorReceiverMock();
      _discountListener = DiscountListenerMock();
    });

    void _getInteractor({CalculateDiscount discountOrigin}) {
      _discountInteractor =
          DiscountInteractor(_discountListener, origin: discountOrigin ?? null);
    }

    test('Obtain final value success', () {
      _discountOrigin = CalculateDiscountSuccessMock(_interactorReceiver);
      _getInteractor(discountOrigin: _discountOrigin);
      _discountInteractor.obtainFinalValue("20", "10");
      expect(_interactorReceiver.callsToReceiveFinalValue, 1);
      expect(_interactorReceiver.valueReceived, 10);
    });

    test('Obtain final value failure', () {
      _discountOrigin = CalculateDiscountFailureMock(_interactorReceiver);
      _getInteractor(discountOrigin: _discountOrigin);
      _discountInteractor.obtainFinalValue("null", "null");
      expect(_interactorReceiver.callsToReceiveFinalValueError, 1);
      expect(_interactorReceiver.errorReceived, "failure");
    });

    test('Receive final value success', () {
      _discountOrigin = CalculateDiscountFailureMock(_interactorReceiver);
      _getInteractor();
      double value = 10;
      _discountInteractor.receiveFinalValue(value);
      expect(_discountListener.callsToReceiveFinalValue, 1);
      expect(_discountListener.value, 'O valor final é ' + value.toStringAsFixed(2));
    });

    test('Receive final value failure', () {
      _discountOrigin = CalculateDiscountFailureMock(_interactorReceiver);
      _getInteractor();
      _discountInteractor.receiveFinalValueError('failure');
      expect(_discountListener.callsToReceiveFinalValue, 1);
      expect(_discountListener.value, 'failure');
    });
  });
}
