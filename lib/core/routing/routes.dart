abstract class Routes {
  static const String splash = '/splash';
  static const String signIn = '/sign_in'; // 로그인 화면
  static const String signUp = '/sign_up'; // 회원가입
  static const String home = '/'; // 홈화면
  static const String profile = '/setings'; // 설정화면(내기록 보기/언어설정/버전정보)
  static const String myPage = '/myPage/:userId'; // 내 기록 보기
  static const String longSentence = '/long_sentence/:id'; // 장문 연습하기
  static const String shortSentence = '/short_sentence/:id'; // 단문 연습하기
  static const String result = '/result'; // 연습결과화면
}
