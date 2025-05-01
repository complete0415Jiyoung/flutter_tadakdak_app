import 'package:tadaktak_app/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<void> execute() async {
    await repository.signOut();
  }
}
