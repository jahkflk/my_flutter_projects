class DeviceModel {
  final int id;
  final String name;
  final String mac;
  final int? groupId;
  final DateTime? createdAt;
  final DateTime? lastConnectedAt;

  DeviceModel({
    required this.id,
    required this.name,
    required this.mac,
    this.groupId,
    this.createdAt,
    this.lastConnectedAt,
  });

  factory DeviceModel.fromMap(Map<String, dynamic> map) {
    return DeviceModel(
      id: map['id'] as int,
      name: map['name'] as String,
      mac: map['mac'] as String,
      groupId: map['group_id'] as int?, // ✅ 正确
      createdAt: DateTime.tryParse(map['created_at'] ?? ''), // ✅
      lastConnectedAt: DateTime.tryParse(map['last_connected_at'] ?? ''), // ✅
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mac': mac,
      'group_id': groupId, // ✅ 修复此字段
      'created_at': createdAt?.toIso8601String(),
      'last_connected_at': lastConnectedAt?.toIso8601String(),
    };
  }
}
