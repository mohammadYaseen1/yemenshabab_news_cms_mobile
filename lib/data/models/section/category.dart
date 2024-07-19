import 'package:yemenshabab_news_cms_mobile/data/models/home/data_type.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/news_type.dart';

class CategorySection {
  CategorySection({
    String? nameAr,
    String? nameEn,
    Layout? layout,
    String? color,
    ViewType? dataType,
  }) {
    _nameAr = nameAr;
    _nameEn = nameEn;
    _layout = layout;
    _color = color;
    _dataType = dataType;
  }

  CategorySection.defaultData()
      : this(
          nameAr: null,
          nameEn: null,
          layout: null,
          color: null,
          dataType: null,
        );

  String? _nameAr;
  String? _nameEn;
  Layout? _layout;
  String? _color;
  ViewType? _dataType;

  String get nameAr => _nameAr ?? '';

  String get nameEn => _nameEn ?? '';

  Layout get layout => _layout ?? Layout.LIST;

  String get color => _color ?? '';

  ViewType get dataType => _dataType ?? ViewType.NEWS;
}
