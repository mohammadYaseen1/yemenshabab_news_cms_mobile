
import 'package:yemenshabab/data/models/home/data_type.dart';

class CategoryData {
  CategoryData({
    String? category,
    Layout? layout,
    String? dataType,}){
    _category = category;
    _layout = layout;
    _dataType = dataType;
  }

  String? _category;
  Layout? _layout;
  String? _dataType;

  String? get category => _category;
  Layout? get layout => _layout;
  String? get dataType => _dataType;

}