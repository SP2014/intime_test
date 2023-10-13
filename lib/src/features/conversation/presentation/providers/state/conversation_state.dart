import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intime_test/src/features/conversation/data/data.dart';

part 'conversation_state.freezed.dart';

@freezed
class ConversationState with _$ConversationState {
  const ConversationState._();

  const factory ConversationState({
    required bool isLoading,
    String? currentFilter,
    String? filteredUserName,
    bool? showRecent,
    List<dynamic>? filters,
    List<ChatContact>? chatContacts,
    required bool isDataPresent,
  }) = _ConversationState;

  const factory ConversationState.initial(
    bool isLoading,
    bool isDataPresent,
    List<dynamic> filters,
    bool showRecent, {
    String? currentFilter,
    List<ChatContact>? chatContacts,
    String? filteredUserName,
  }) = _Initial;
}
