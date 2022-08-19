import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var pinFormatter = MaskTextInputFormatter(
    mask: '######',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

var ibanFormatter = MaskTextInputFormatter(
    mask: '####-####-####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

var amountFormatter = MaskTextInputFormatter(
    mask: '\$###########',
    filter: {"#": RegExp(r'[0-9\.]')},
    type: MaskAutoCompletionType.lazy);
