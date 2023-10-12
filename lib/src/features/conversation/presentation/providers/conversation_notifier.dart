import 'package:intime_test/src/core/core.dart';
import 'package:intime_test/src/features/auth/auth.dart';
import 'package:intime_test/src/features/conversation/domain/domain.dart';
import 'package:intime_test/src/features/conversation/presentation/providers/state/conversation_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'conversation_notifier.g.dart';

@riverpod
class ConversationNotifier extends _$ConversationNotifier {
  late AuthRepository _authRepository;
  late ChatRepository _chatRepository;

  @override
  FutureOr<ConversationState> build() {
    _authRepository = ref.watch(authRepositoryProvider);
    _chatRepository = ref.watch(chatRepositoryProvider);
    //_chatRepository.
    return const ConversationState.initial(true, filters, true);
  }
}
