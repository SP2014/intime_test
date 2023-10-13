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
    _chatRepository.getChatContacts().listen((event) {
      state = AsyncValue.data(ConversationState(
        isLoading: false,
        chatContacts: event,
        filters: state.value!.filters,
        currentFilter: state.value!.currentFilter,
      ));
    });
    return const ConversationState.initial(true, filters, true);
  }

  void onOptionsSelected(Map<String, dynamic> option) {
    final options = state.value?.filters;
    String? selectedOption;
    final filteredOptions = options?.map((e) {
      if (e['value'] == option['value']) {
        Map<String, dynamic> updated = {...e};
        updated['isActive'] = !updated['isActive'];
        selectedOption = e['value'];
        return updated;
      }
      return e;
    }).toList();
    state = AsyncValue.data(ConversationState(
        isLoading: false,
        filters: filteredOptions,
        currentFilter: selectedOption ?? ''));
  }
}
