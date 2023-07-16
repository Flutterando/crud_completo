import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thing_stuffs/src/features/auth/interactor/atoms/auth_atom.dart';
import 'package:thing_stuffs/src/features/auth/interactor/entities/tokenization.dart';
import 'package:thing_stuffs/src/features/auth/interactor/reducers/auth_reducer.dart';
import 'package:thing_stuffs/src/features/auth/interactor/services/auth_service.dart';
import 'package:thing_stuffs/src/features/auth/interactor/states/auth_state.dart';

class AuthServiceMock extends Mock implements AuthService {}

void main() {
  final service = AuthServiceMock();
  final reducer = AuthReducer(service);

  tearDown(() => reset(service));
  tearDownAll(() => reducer.dispose());

  group('_checkAuth | ', () {
    test('Logged', () {
      final logged = Logged(const Tokenization(idToken: ''));
      when(() => service.checkAuth()).thenAnswer((_) async => logged);

      expect(
        authState.buffer(2),
        completion([isA<LoadingAuth>(), logged]),
      );

      checkAuthAction();
    });
  });
}
