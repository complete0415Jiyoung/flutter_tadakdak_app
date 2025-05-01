import 'package:firebase_auth/firebase_auth.dart';
import 'package:tadaktak_app/data/data_source/auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  AuthDataSourceImpl(this._firebaseAuth);

  @override
  Future<User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<void> reloadUser(User user) async {
    await user.reload();
  }

  @override
  Future<UserCredential> signInAnonymously() async {
    return await _firebaseAuth.signInAnonymously();
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> updateUserProfile(User user, String name) async {
    await user.updateDisplayName(name);
  }
}
