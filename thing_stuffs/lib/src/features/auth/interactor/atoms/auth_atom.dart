import 'package:asp/asp.dart';

import '../dtos/email_credential_dto.dart';
import '../states/auth_state.dart';

// atom
final authState = Atom<AuthState>(
  InitAuth(),
  key: 'authState',
);

// actions
final checkAuthAction = Atom.action(key: 'checkAuthAction');

final loginWithEmailAction = Atom<EmailCredentialDTO>(
  EmailCredentialDTO(),
  key: 'loginWithEmailAction',
);

final logoutAction = Atom.action(
  key: 'logoutAction',
);
