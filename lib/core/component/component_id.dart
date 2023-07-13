import 'package:collection/collection.dart';

enum ComponentId {
  accountSlider("account-slider"),
  overdraftInfo("overdraft-info"),
  accountSummary("account-summary"),
  lastTransactions("last-transactions"),
  subNavigation("sub-navigation"),
  unknown("");

  const ComponentId(this.value);

  final String value;

  factory ComponentId.fromValue(String? value) {
    return ComponentId.values.firstWhereOrNull((element) => element.value == value) ?? ComponentId.unknown;
  }
}
