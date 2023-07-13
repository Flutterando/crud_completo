import 'package:asp/asp.dart';

import '../exceptions/exceptions.dart';

final globalLoaderState = Atom(
  false,
  key: 'globalLoaderState',
);

final globalExceptionState = Atom<ThingsException?>(
  null,
  key: 'globalExceptionState',
  pipe: interval(const Duration(seconds: 1)),
);
