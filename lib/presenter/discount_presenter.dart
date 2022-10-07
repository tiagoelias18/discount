import 'dart:async';
import 'package:discount/interactor/discount_interactor.dart';
import 'package:discount/interactor/discount_interactor_provider.dart';
import 'package:discount/presenter/discount_listener.dart';
import 'package:discount/presenter/discount_provider.dart';
import 'package:flutter/material.dart';

class DiscountPresenter extends ChangeNotifier
    implements DiscountProvider, DiscountListener {
  final StreamController _controller = StreamController<String>();

  @override
  Stream<String> get outController => _controller.stream;

  DiscountInteractorProvider _interactor;

  DiscountPresenter({DiscountInteractorProvider interactor}) {
    _interactor = interactor ?? DiscountInteractor(this);
  }

  @override
  void obtainFinalValue(String value, String discount) {
    _interactor.obtainFinalValue(value, discount);
  }

  @override
  void receiveFinalValue(String value) {
    _controller.sink.add(value);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }
}
