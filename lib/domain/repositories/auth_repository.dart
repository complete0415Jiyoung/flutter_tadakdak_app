import 'package:tadaktak_app/domain/entities/app_user.dart';

abstract interface class AuthRepository {
  Future<AppUser?> getCurrentUser(); // 현재 사용자 정보 가져오기
  Future<AppUser> signInWithEmail(String email, String password); // 이메일로 로그인
  Future<AppUser> signUpWithEmail(
    String email,
    String password,
    String name,
  ); // 이메일로 회원가입
  Future<AppUser> signInAnonymously(); // 익명 로그인
  Future<void> signOut(); // 로그아웃
  // Future<void> deleteAccount(); // 계정 삭제
}
