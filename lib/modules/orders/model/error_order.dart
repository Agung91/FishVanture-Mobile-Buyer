import 'package:app/common/errors/errors.dart';

class OrderError extends Errors {
  OrderError()
      : super(message: 'Harap lengkapi field', code: 'Field Cant Be Empty');
}
