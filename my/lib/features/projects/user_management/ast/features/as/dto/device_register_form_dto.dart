class DeviceRegisterFormDto {
  final String name;
  final String mac;
  final int groupId;

  DeviceRegisterFormDto({
    required this.name,
    required this.mac,
    required this.groupId,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'mac': mac,
        'group_id': groupId,
      };
}
