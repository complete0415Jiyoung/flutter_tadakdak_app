import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

abstract interface class AuthDataSource {
  Future<firebase_auth.User?> getCurrentUser(); // 현재 사용자 정보 가져오기
  Future<firebase_auth.UserCredential> signInWithEmail(
    String email,
    String password,
  ); // 이메일로 로그인
  Future<firebase_auth.UserCredential> signUpWithEmail(
    String email,
    String password,
  ); // 이메일로 회원가입
  Future<void> updateUserProfile(
    firebase_auth.User user,
    String name,
  ); // 사용자 프로필 업데이트
  Future<void> reloadUser(firebase_auth.User user); // 사용자 정보 새로고침
  Future<firebase_auth.UserCredential> signInAnonymously(); // 익명 로그인
  Future<void> signOut(); // 로그아웃
}
