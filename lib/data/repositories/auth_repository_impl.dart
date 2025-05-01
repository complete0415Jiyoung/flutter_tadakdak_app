import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:tadaktak_app/data/data_source/auth_data_source.dart';
import 'package:tadaktak_app/domain/entities/app_user.dart';
import 'package:tadaktak_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;
  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = await _authDataSource.getCurrentUser();
    if (firebaseUser == null) return null;
    return AppUser.fromFirebase(firebaseUser);
  }

  @override
  Future<AppUser> signInAnonymously() async {
    try {
      final result = await _authDataSource.signInAnonymously();
      return AppUser.fromFirebase(result.user!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthError(e);
    }
  }

  @override
  Future<AppUser> signInWithEmail(String email, String password) async {
    try {
      final result = await _authDataSource.signInWithEmail(email, password);
      return AppUser.fromFirebase(result.user!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthError(e);
    }
  }

  @override
  Future<void> signOut() async {
    await _authDataSource.signOut();
  }

  @override
  Future<AppUser> signUpWithEmail(
    String email,
    String password,
    String name,
  ) async {
    try {
      final result = await _authDataSource.signUpWithEmail(email, password);

      await _authDataSource.updateUserProfile(result.user!, name);
      await _authDataSource.reloadUser(result.user!);

      final updatedUser = await _authDataSource.getCurrentUser();
      return AppUser.fromFirebase(updatedUser!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthError(e);
    }
  }

  Exception _handleFirebaseAuthError(firebase_auth.FirebaseAuthException e) {
    print('Firebase 오류 코드: ${e.code}'); // 디버깅용 로그

    switch (e.code) {
      case 'user-not-found':
        return Exception('존재하지 않는 이메일입니다.');
      case 'wrong-password':
        return Exception('잘못된 비밀번호입니다.');
      case 'email-already-in-use':
        return Exception('이미 사용 중인 이메일입니다.');
      case 'weak-password':
        return Exception('비밀번호가 너무 약합니다.');
      case 'invalid-email':
        return Exception('유효하지 않은 이메일 형식입니다.');
      case 'invalid-credential':
        return Exception('존재하지 않는 이메일이거나 비밀번호가 일치하지 않습니다.');
      case 'account-exists-with-different-credential':
        return Exception('이 이메일은 다른 로그인 방식으로 가입되어 있습니다.');
      case 'operation-not-allowed':
        return Exception('이 로그인 방식은 현재 비활성화되어 있습니다.');
      case 'user-disabled':
        return Exception('이 계정은 비활성화되었습니다. 관리자에게 문의하세요.');
      case 'too-many-requests':
        return Exception('너무 많은 요청이 있었습니다. 잠시 후 다시 시도해주세요.');
      case 'credential-already-in-use':
        return Exception('이 계정은 이미 다른 사용자에게 연결되어 있습니다.');
      default:
        return Exception('로그인 중 오류가 발생했습니다: ${e.message} (코드: ${e.code})');
    }
  }
}
