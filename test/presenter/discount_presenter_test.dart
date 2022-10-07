import 'package:discount/presenter/discount_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import '../interactor/discount_interactor_provider_mock.dart';

main() {
  group('Discount presenter', () {
    DiscountPresenter _discountPresenter;
    DiscountInteractorProviderMock _discountInteractorMock;

    setUpAll(() {
      _discountInteractorMock = DiscountInteractorProviderMock();
      _discountPresenter = DiscountPresenter(interactor: _discountInteractorMock);
    });

    test('Verify user has token', () {
      _discountPresenter.obtainFinalValue("4", "2");
      expect(_discountInteractorMock.callsToObtainFinalValues, 1);
    });

    test('Dispose', () {
      _discountPresenter.dispose();
      expect(_discountPresenter.outController, neverEmits(isNegative));
    });
  });
}
