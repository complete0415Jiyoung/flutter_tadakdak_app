import '../../entities/app_user.dart';
import '../../repositories/auth_repository.dart';

class SignInWithEmailUseCase {
  final AuthRepository repository;

  SignInWithEmailUseCase(this.repository);

  Future<AppUser> execute(String email, String password) async {
    return await repository.signInWithEmail(email, password);
  }
}
