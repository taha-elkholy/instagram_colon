import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_colon/state/auth/backend/authenticator.dart';
import 'package:instagram_colon/state/auth/models/auth_result.dart';
import 'package:instagram_colon/state/auth/models/auth_state.dart';
import 'package:instagram_colon/state/posts/typedef/user_id.dart';
import 'package:instagram_colon/state/user_info/backend/user_info_storage.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();
  final _userInfoStorage = const UserInfoStorage();

  AuthStateNotifier() : super(const AuthState.unKnown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        result: AuthResult.success,
        isLoading: false,
        userId: _authenticator.userId,
      );
    }
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      // save user data to firebase
      await _saveUserInfo(
        userId: userId,
      );
    }
    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }
  Future<void> loginWithFaceBook() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithFaceBook();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      // save user data to firebase
      await _saveUserInfo(
        userId: userId,
      );
    }
    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }

  // userId required to make sure it is not null or invalid
  Future<void> _saveUserInfo({
    required UserId userId,
  }) =>
      _userInfoStorage.saveUserInfo(
          userId: userId,
          displayName: _authenticator.displayName,
          email: _authenticator.email,
          );

  Future<void> logout() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logout();
    state = const AuthState.unKnown();
  }
}
