import 'group_model.dart';

class GroupFormState {
  final String groupName;
  final bool isSubmitting;

  const GroupFormState({
    this.groupName = '',
    this.isSubmitting = false,
  });

  GroupFormState copyWith({
    String? groupName,
    bool? isSubmitting,
  }) {
    return GroupFormState(
      groupName: groupName ?? this.groupName,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
