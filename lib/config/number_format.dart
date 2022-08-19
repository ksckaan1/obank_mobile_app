import 'package:mybank/config/regexp_comps.dart';

extension IBANFormatExtension on int {
  String toIBANFormat() {
    String stringType = "$this";
    var result = stringType.replaceAllMapped(ibanComp, (m) => "${m[1]} ");
    return result;
  }
}
