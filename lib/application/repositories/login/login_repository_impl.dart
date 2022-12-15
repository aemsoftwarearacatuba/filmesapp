import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<UserCredential> login() async {
    final googleUser = await GoogleSignIn(
            scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
            clientId:
                "723752730927-62blqn14uhbvdc9ttoa6pca0j2rrv0qf.apps.googleusercontent.com")
        .signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return FirebaseAuth.instance.signInWithCredential(credential);
    }

    throw Exception('Erro ao realizar login com o Google!');
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn(
            scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
            clientId:
                "723752730927-62blqn14uhbvdc9ttoa6pca0j2rrv0qf.apps.googleusercontent.com")
        .signOut();
    FirebaseAuth.instance.signOut();
  }
}
