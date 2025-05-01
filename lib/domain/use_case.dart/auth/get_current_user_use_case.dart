import '../../entities/app_user.dart';
import '../../repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  // 이 메서드를 통해 클래스 인스턴스를 함수처럼 호출할 수 있음
  Future<AppUser?> execute() async {
    return await repository.getCurrentUser();
  }
}
