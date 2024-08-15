class Section {
  Section({
    String? uuid,
    String? nameAr,
    String? nameEn,
    bool? onBar,
    String? color,
  }) {
    _uuid = uuid;
    _nameAr = nameAr;
    _nameEn = nameEn;
    _onBar = onBar;
    _color = color;
  }

  String? _uuid;
  String? _nameAr;
  String? _nameEn;
  bool? _onBar;
  String? _color;

  String? get uuid => _uuid;

  String? get nameAr => _nameAr;

  String? get nameEn => _nameEn;

  bool? get onBar => _onBar;

  String? get color => _color;
}
