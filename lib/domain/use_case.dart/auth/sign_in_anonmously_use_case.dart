import '../../entities/app_user.dart';
import '../../repositories/auth_repository.dart';

class SignInAnonymouslyUseCase {
  final AuthRepository repository;

  SignInAnonymouslyUseCase(this.repository);

  Future<AppUser> execute() async {
    return await repository.signInAnonymously();
  }
}
