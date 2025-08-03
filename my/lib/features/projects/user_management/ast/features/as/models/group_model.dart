class GroupModel {
  final int id;
  final String groupName;
  final int displayOrder;

  GroupModel({
    required this.id,
    required this.groupName,
    required this.displayOrder,
  });

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id: map['id'],
      groupName: map['group_name'], // ✅ 修正字段名
      displayOrder: map['display_order'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'group_name': groupName, // ✅ 修正字段名
      'display_order': displayOrder,
    };
  }

  GroupModel copyWith({
    int? id,
    String? groupName,
    int? displayOrder,
  }) {
    return GroupModel(
      id: id ?? this.id,
      groupName: groupName ?? this.groupName,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}
