import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _ConversationState;

  const factory ConversationState.initial(
      bool isLoading, List<dynamic> filters, bool showRecent) = _Initial;
}
