abstract class DiscountProvider{
  Stream<String> get outController;
  void obtainFinalValue(String price, String discount);
}