class GroupRegisterFormDto {
  final String groupName;
  final int? displayOrder;

  GroupRegisterFormDto({
    required this.groupName,
    this.displayOrder,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'group_name': groupName,
    };
    if (displayOrder != null) {
      map['display_order'] = displayOrder;
    }
    return map;
  }
}
