import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_colon/state/auth/providers/auth_state_provider.dart';

// listen for more than one provider
final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.isLoading;
});
