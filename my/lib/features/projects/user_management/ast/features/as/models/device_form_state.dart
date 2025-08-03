class DeviceFormState {
  final String name;
  final String mac;
  final int? groupId;
  final bool isSubmitting;

  const DeviceFormState({
    this.name = '',
    this.mac = '',
    this.groupId,
    this.isSubmitting = false,
  });

  DeviceFormState copyWith({
    String? name,
    String? mac,
    int? groupId,
    bool? isSubmitting,
  }) {
    return DeviceFormState(
      name: name ?? this.name,
      mac: mac ?? this.mac,
      groupId: groupId ?? this.groupId,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
