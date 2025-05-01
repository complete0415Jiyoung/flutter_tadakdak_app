// lib/core/validation/validation_manager.dart

/// 앱 전체에서 사용할 수 있는 유효성 검사 유틸리티 클래스
class ValidationManager {
  // 싱글톤 패턴 구현
  ValidationManager._();
  static final ValidationManager instance = ValidationManager._();

  // 이메일 유효성 검사
  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // 최소/최대 길이 상수
  static const int minPasswordLength = 6;
  static const int minNameLength = 2;
  static const int maxNameLength = 10;

  /// 이메일 유효성 검사
  /// [email] 검사할 이메일 주소
  /// 유효하면 null, 유효하지 않으면 오류 메시지 반환
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return '이메일을 입력해주세요';
    }

    if (!_emailRegex.hasMatch(email)) {
      return '유효한 이메일 주소를 입력해주세요';
    }

    return null;
  }

  /// 비밀번호 유효성 검사
  /// [password] 검사할 비밀번호
  /// 유효하면 null, 유효하지 않으면 오류 메시지 반환
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return '비밀번호를 입력해주세요';
    }

    if (password.length < minPasswordLength) {
      return '비밀번호는 $minPasswordLength자 이상이어야 합니다';
    }

    return null;
  }

  /// 비밀번호 확인 유효성 검사
  /// [confirmPassword] 확인할 비밀번호
  /// [originalPassword] 원래 비밀번호
  /// 유효하면 null, 유효하지 않으면 오류 메시지 반환
  String? validateConfirmPassword(
    String? confirmPassword,
    String originalPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return '비밀번호 확인을 입력해주세요';
    }

    if (confirmPassword != originalPassword) {
      return '비밀번호가 일치하지 않습니다';
    }

    return null;
  }

  /// 이름 유효성 검사
  /// [name] 검사할 이름
  /// 유효하면 null, 유효하지 않으면 오류 메시지 반환
  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return '이름을 입력해주세요';
    }

    if (name.length < minNameLength) {
      return '이름은 $minNameLength자 이상이어야 합니다';
    }

    if (name.length > maxNameLength) {
      return '이름은 $maxNameLength자 이하여야 합니다';
    }

    return null;
  }
}
