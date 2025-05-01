import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tadaktak_app/domain/use_case.dart/auth/get_current_user_use_case.dart';
import 'package:tadaktak_app/domain/use_case.dart/auth/sign_out_use_case.dart';
import '../state/auth_state.dart';

// 기본 인증 상태 관리 (현재 사용자 및 로그아웃)
class AuthStateNotifier extends StateNotifier<AuthState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SignOutUseCase _signOutUseCase;

  AuthStateNotifier(this._getCurrentUserUseCase, this._signOutUseCase)
    : super(const AuthState()) {
    _init();
  }

  Future<void> _init() async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await _getCurrentUserUseCase.execute();
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await _signOutUseCase.execute();
      state = const AuthState();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  // 인증 성공 후 상태 업데이트 (다른 ViewModel에서 호출)
  void updateAuthState(user) {
    state = state.copyWith(user: user, isLoading: false, errorMessage: null);
  }
}
