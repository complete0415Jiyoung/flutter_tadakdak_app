import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/app_user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  @override
  final AppUser? user;
  @override
  final bool isLoading;
  @override
  final String? errorMessage;

  const AuthState({this.user, this.isLoading = false, this.errorMessage});
}
