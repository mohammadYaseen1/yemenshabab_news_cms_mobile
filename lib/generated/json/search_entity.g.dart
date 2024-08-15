import 'package:yemenshabab/generated/json/base/json_convert_content.dart';
import 'package:yemenshabab/data/models/search_entity.dart';

SearchEntity $SearchEntityFromJson(Map<String, dynamic> json) {
  final SearchEntity searchEntity = SearchEntity();
  final List<SearchSearchItems>? searchItems = (json['searchItems'] as List<
      dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<SearchSearchItems>(e) as SearchSearchItems)
      .toList();
  if (searchItems != null) {
    searchEntity.searchItems = searchItems;
  }
  final String? totalRecords = jsonConvert.convert<String>(
      json['totalRecords']);
  if (totalRecords != null) {
    searchEntity.totalRecords = totalRecords;
  }
  return searchEntity;
}

Map<String, dynamic> $SearchEntityToJson(SearchEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['searchItems'] = entity.searchItems?.map((v) => v.toJson()).toList();
  data['totalRecords'] = entity.totalRecords;
  return data;
}

extension SearchEntityExtension on SearchEntity {
  SearchEntity copyWith({
    List<SearchSearchItems>? searchItems,
    String? totalRecords,
  }) {
    return SearchEntity()
      ..searchItems = searchItems ?? this.searchItems
      ..totalRecords = totalRecords ?? this.totalRecords;
  }
}

SearchSearchItems $SearchSearchItemsFromJson(Map<String, dynamic> json) {
  final SearchSearchItems searchSearchItems = SearchSearchItems();
  final String? titleEn = jsonConvert.convert<String>(json['titleEn']);
  if (titleEn != null) {
    searchSearchItems.titleEn = titleEn;
  }
  final String? titleAr = jsonConvert.convert<String>(json['titleAr']);
  if (titleAr != null) {
    searchSearchItems.titleAr = titleAr;
  }
  final String? subtitleEn = jsonConvert.convert<String>(json['subtitleEn']);
  if (subtitleEn != null) {
    searchSearchItems.subtitleEn = subtitleEn;
  }
  final String? subtitleAr = jsonConvert.convert<String>(json['subtitleAr']);
  if (subtitleAr != null) {
    searchSearchItems.subtitleAr = subtitleAr;
  }
  final String? route = jsonConvert.convert<String>(json['route']);
  if (route != null) {
    searchSearchItems.route = route;
  }
  return searchSearchItems;
}

Map<String, dynamic> $SearchSearchItemsToJson(SearchSearchItems entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['titleEn'] = entity.titleEn;
  data['titleAr'] = entity.titleAr;
  data['subtitleEn'] = entity.subtitleEn;
  data['subtitleAr'] = entity.subtitleAr;
  data['route'] = entity.route;
  return data;
}

extension SearchSearchItemsExtension on SearchSearchItems {
  SearchSearchItems copyWith({
    String? titleEn,
    String? titleAr,
    String? subtitleEn,
    String? subtitleAr,
    String? route,
  }) {
    return SearchSearchItems()
      ..titleEn = titleEn ?? this.titleEn
      ..titleAr = titleAr ?? this.titleAr
      ..subtitleEn = subtitleEn ?? this.subtitleEn
      ..subtitleAr = subtitleAr ?? this.subtitleAr
      ..route = route ?? this.route;
  }
}