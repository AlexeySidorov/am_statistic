import 'package:mvvm/mvvm.dart';
import 'package:statistic_covid19/infrastructure/base/BaseViewModel.dart';

abstract class BaseView<T extends BaseViewModel> extends View<T> {
  BaseView(T model) : super(model);
}
