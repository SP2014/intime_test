import 'package:intime_test/src/core/core.dart';
import 'package:intime_test/src/features/conversation/domain/domain.dart';
import 'package:intime_test/src/features/conversation/presentation/providers/state/conversation_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

part 'conversation_notifier.g.dart';

@riverpod
class ConversationNotifier extends _$ConversationNotifier {
  late ChatRepository _chatRepository;

  @override
  FutureOr<ConversationState> build() {
    _chatRepository = ref.watch(chatRepositoryProvider);
    _chatRepository.getChatContacts().listen((event) {
      state = AsyncValue.data(ConversationState(
        isLoading: false,
        isDataPresent: event.isNotEmpty,
        chatContacts: event,
        filters: state.value!.filters,
        showRecent: state.value!.showRecent,
        currentFilter: state.value!.currentFilter,
      ));
    });
    return const ConversationState.initial(true, false, filters, true);
  }

  void onOptionsSelected(Map<String, dynamic> option) {
    final options = state.value?.filters;
    String? selectedOption;
    List<dynamic>? filteredOptions;
    bool? showRecent = state.value!.showRecent;
    if (option['value'] == 'chats' ||
        options?.firstWhereOrNull(
                (ele) => (ele['value'] == 'chats' && ele['isActive'])) !=
            null) {
      filteredOptions = chatFilters;
    } else {
      filteredOptions = filters;
    }

    filteredOptions = filteredOptions.map((e) {
      if (e['value'] == option['value']) {
        Map<String, dynamic> updated = {...e};
        updated['isActive'] = !updated['isActive'];
        selectedOption = updated['isActive'] ? e['value'] : '';
        showRecent = selectedOption == 'recent';
        return updated;
      }
      return e;
    }).toList();

    state = AsyncValue.data(
      state.value!.copyWith(
          isLoading: false,
          showRecent: showRecent ?? true,
          filters: filteredOptions,
          currentFilter: selectedOption),
    );
  }
}
