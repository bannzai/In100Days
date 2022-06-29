import 'package:in_100_days/entrypoint.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.PROD;
  entrypoint();
}
