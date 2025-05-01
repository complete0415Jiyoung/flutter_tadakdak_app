import '../../entities/app_user.dart';
import '../../repositories/auth_repository.dart';

class SignUpWithEmailUseCase {
  final AuthRepository repository;

  SignUpWithEmailUseCase(this.repository);

  Future<AppUser> execute(String email, String password, String name) async {
    return await repository.signUpWithEmail(email, password, name);
  }
}
