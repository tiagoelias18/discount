import 'package:discount/interactor/discount_interactor_provider.dart';

class DiscountInteractorProviderMock implements DiscountInteractorProvider {
  int callsToObtainFinalValues = 0;

  @override
  void obtainFinalValue(String value, String discount) {
    callsToObtainFinalValues += 1;
  }
}