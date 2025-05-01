import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AppUser {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final bool isAnonymous;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.isAnonymous,
  });

  // 익명 사용자를 위한 팩토리 메서드
  factory AppUser.anonymous(String id) {
    return AppUser(
      id: id,
      name: "Guest", // 기본값 제공
      email: "", // 빈 문자열 또는 "anonymous@example.com" 같은 기본값
      isAnonymous: true,
    );
  }

  // Firebase User로부터 생성하는 팩토리 메서드
  factory AppUser.fromFirebase(firebase_auth.User firebaseUser) {
    if (firebaseUser.isAnonymous) {
      return AppUser.anonymous(firebaseUser.uid);
    }

    return AppUser(
      id: firebaseUser.uid,
      name: firebaseUser.displayName ?? "User", // 기본값 제공
      email: firebaseUser.email ?? "", // 기본값 제공
      photoUrl: firebaseUser.photoURL,
      isAnonymous: firebaseUser.isAnonymous,
    );
  }
}
