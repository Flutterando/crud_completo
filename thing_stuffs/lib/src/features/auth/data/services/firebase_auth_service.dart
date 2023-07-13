import 'package:firebase_auth/firebase_auth.dart';
import 'package:thing_stuffs/src/features/auth/interactor/dtos/email_credential_dto.dart';
import 'package:thing_stuffs/src/features/auth/interactor/entities/tokenization.dart';
import 'package:thing_stuffs/src/features/auth/interactor/services/auth_service.dart';
import 'package:thing_stuffs/src/features/auth/interactor/states/auth_state.dart';

class FirebaseAuthService extends AuthService {
  final FirebaseAuth auth;

  FirebaseAuthService(this.auth);

  @override
  Future<AuthState> checkAuth() async {
    final token = await auth.currentUser?.getIdToken();
    if (token == null) {
      return Unlogged();
    } else {
      final tokenization = Tokenization(idToken: token);
      return Logged(tokenization);
    }
  }

  @override
  Future<AuthState> loginWithEmail(EmailCredentialDTO dto) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: dto.email,
        password: dto.password,
      );
      return checkAuth();
    } catch (e) {
      return Unlogged();
    }
  }

  @override
  Future<AuthState> logout() async {
    await auth.signOut();
    return Unlogged();
  }
}
