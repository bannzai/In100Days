import '../../entity/user.codegen.dart';
import 'state.codegen.dart';
import 'package:riverpod/riverpod.dart';

final homeStateNotifierProvider = StateNotifierProvider.autoDispose
    .family<HomeStateNotifier, AsyncValue<HomeState>, User>(
  (ref, user) => HomeStateNotifier(
    initialState: ref.watch(homeAsyncStateProvider(user)),
  ),
);

class HomeStateNotifier extends StateNotifier<AsyncValue<HomeState>> {
  HomeStateNotifier({
    required AsyncValue<HomeState> initialState,
  }) : super(initialState);
}
