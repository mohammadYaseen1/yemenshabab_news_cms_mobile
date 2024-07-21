// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:yemenshabab_news_cms_mobile/data/models/playlist_entity.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/program_schedule_entity.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/section/section_data_entity.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/writer_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/app/models/setting_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/news/news_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/program/program_entity.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/section/section_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(Object error, StackTrace stackTrace);
extension MapSafeExt<K, V> on Map<K, V> {
  T? getOrNull<T>(K? key) {
    if (!containsKey(key) || key == null) {
      return null;
    } else {
      return this[key] as T?;
    }
  }
}

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) =>
      _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        var covertFunc = convertFuncMap[type]!;
        if (covertFunc is Map<String, dynamic>) {
          return covertFunc(value as Map<String, dynamic>) as T;
        } else {
          return covertFunc(Map<String, dynamic>.from(value)) as T;
        }
      } else {
        throw UnimplementedError(
            '$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<PlaylistEntity>[] is M) {
      return data.map<PlaylistEntity>((Map<String, dynamic> e) =>
          PlaylistEntity.fromJson(e)).toList() as M;
    }
    if (<PlaylistItems>[] is M) {
      return data.map<PlaylistItems>((Map<String, dynamic> e) =>
          PlaylistItems.fromJson(e)).toList() as M;
    }
    if (<PlaylistItemsSnippet>[] is M) {
      return data.map<PlaylistItemsSnippet>((Map<String, dynamic> e) =>
          PlaylistItemsSnippet.fromJson(e)).toList() as M;
    }
    if (<PlaylistItemsSnippetThumbnails>[] is M) {
      return data.map<PlaylistItemsSnippetThumbnails>((
          Map<String, dynamic> e) => PlaylistItemsSnippetThumbnails.fromJson(e))
          .toList() as M;
    }
    if (<PlaylistItemsSnippetThumbnailsDefault>[] is M) {
      return data.map<PlaylistItemsSnippetThumbnailsDefault>((
          Map<String, dynamic> e) =>
          PlaylistItemsSnippetThumbnailsDefault.fromJson(e)).toList() as M;
    }
    if (<PlaylistItemsSnippetThumbnailsMedium>[] is M) {
      return data.map<PlaylistItemsSnippetThumbnailsMedium>((
          Map<String, dynamic> e) =>
          PlaylistItemsSnippetThumbnailsMedium.fromJson(e)).toList() as M;
    }
    if (<PlaylistItemsSnippetThumbnailsHigh>[] is M) {
      return data.map<PlaylistItemsSnippetThumbnailsHigh>((
          Map<String, dynamic> e) =>
          PlaylistItemsSnippetThumbnailsHigh.fromJson(e)).toList() as M;
    }
    if (<PlaylistItemsSnippetThumbnailsStandard>[] is M) {
      return data.map<PlaylistItemsSnippetThumbnailsStandard>((
          Map<String, dynamic> e) =>
          PlaylistItemsSnippetThumbnailsStandard.fromJson(e)).toList() as M;
    }
    if (<PlaylistItemsSnippetThumbnailsMaxres>[] is M) {
      return data.map<PlaylistItemsSnippetThumbnailsMaxres>((
          Map<String, dynamic> e) =>
          PlaylistItemsSnippetThumbnailsMaxres.fromJson(e)).toList() as M;
    }
    if (<PlaylistItemsSnippetResourceId>[] is M) {
      return data.map<PlaylistItemsSnippetResourceId>((
          Map<String, dynamic> e) => PlaylistItemsSnippetResourceId.fromJson(e))
          .toList() as M;
    }
    if (<PlaylistItemsContentDetails>[] is M) {
      return data.map<PlaylistItemsContentDetails>((Map<String, dynamic> e) =>
          PlaylistItemsContentDetails.fromJson(e)).toList() as M;
    }
    if (<PlaylistItemsStatus>[] is M) {
      return data.map<PlaylistItemsStatus>((Map<String, dynamic> e) =>
          PlaylistItemsStatus.fromJson(e)).toList() as M;
    }
    if (<PlaylistPageInfo>[] is M) {
      return data.map<PlaylistPageInfo>((Map<String, dynamic> e) =>
          PlaylistPageInfo.fromJson(e)).toList() as M;
    }
    if (<ProgramScheduleEntity>[] is M) {
      return data.map<ProgramScheduleEntity>((Map<String, dynamic> e) =>
          ProgramScheduleEntity.fromJson(e)).toList() as M;
    }
    if (<ProgramSchedulePrograms>[] is M) {
      return data.map<ProgramSchedulePrograms>((Map<String, dynamic> e) =>
          ProgramSchedulePrograms.fromJson(e)).toList() as M;
    }
    if (<SectionDataEntity>[] is M) {
      return data.map<SectionDataEntity>((Map<String, dynamic> e) =>
          SectionDataEntity.fromJson(e)).toList() as M;
    }
    if (<SectionDataData>[] is M) {
      return data.map<SectionDataData>((Map<String, dynamic> e) =>
          SectionDataData.fromJson(e)).toList() as M;
    }
    if (<SectionDataLatestData>[] is M) {
      return data.map<SectionDataLatestData>((Map<String, dynamic> e) =>
          SectionDataLatestData.fromJson(e)).toList() as M;
    }
    if (<SectionDataMostViewed>[] is M) {
      return data.map<SectionDataMostViewed>((Map<String, dynamic> e) =>
          SectionDataMostViewed.fromJson(e)).toList() as M;
    }
    if (<WriterEntity>[] is M) {
      return data.map<WriterEntity>((Map<String, dynamic> e) =>
          WriterEntity.fromJson(e)).toList() as M;
    }
    if (<WriterWriter>[] is M) {
      return data.map<WriterWriter>((Map<String, dynamic> e) =>
          WriterWriter.fromJson(e)).toList() as M;
    }
    if (<WriterArticles>[] is M) {
      return data.map<WriterArticles>((Map<String, dynamic> e) =>
          WriterArticles.fromJson(e)).toList() as M;
    }
    if (<WriterArticlesResources>[] is M) {
      return data.map<WriterArticlesResources>((Map<String, dynamic> e) =>
          WriterArticlesResources.fromJson(e)).toList() as M;
    }
    if (<SettingEntity>[] is M) {
      return data.map<SettingEntity>((Map<String, dynamic> e) =>
          SettingEntity.fromJson(e)).toList() as M;
    }
    if (<NewsEntity>[] is M) {
      return data.map<NewsEntity>((Map<String, dynamic> e) =>
          NewsEntity.fromJson(e)).toList() as M;
    }
    if (<NewsCategory>[] is M) {
      return data.map<NewsCategory>((Map<String, dynamic> e) =>
          NewsCategory.fromJson(e)).toList() as M;
    }
    if (<NewsKeywords>[] is M) {
      return data.map<NewsKeywords>((Map<String, dynamic> e) =>
          NewsKeywords.fromJson(e)).toList() as M;
    }
    if (<NewsExtras>[] is M) {
      return data.map<NewsExtras>((Map<String, dynamic> e) =>
          NewsExtras.fromJson(e)).toList() as M;
    }
    if (<ProgramEntity>[] is M) {
      return data.map<ProgramEntity>((Map<String, dynamic> e) =>
          ProgramEntity.fromJson(e)).toList() as M;
    }
    if (<ProgramPrograms>[] is M) {
      return data.map<ProgramPrograms>((Map<String, dynamic> e) =>
          ProgramPrograms.fromJson(e)).toList() as M;
    }
    if (<SectionEntity>[] is M) {
      return data.map<SectionEntity>((Map<String, dynamic> e) =>
          SectionEntity.fromJson(e)).toList() as M;
    }
    if (<SectionSections>[] is M) {
      return data.map<SectionSections>((Map<String, dynamic> e) =>
          SectionSections.fromJson(e)).toList() as M;
    }
    if (<SectionSectionsCategories>[] is M) {
      return data.map<SectionSectionsCategories>((Map<String, dynamic> e) =>
          SectionSectionsCategories.fromJson(e)).toList() as M;
    }

    debugPrint("$M not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((dynamic e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (PlaylistEntity).toString(): PlaylistEntity.fromJson,
    (PlaylistItems).toString(): PlaylistItems.fromJson,
    (PlaylistItemsSnippet).toString(): PlaylistItemsSnippet.fromJson,
    (PlaylistItemsSnippetThumbnails).toString(): PlaylistItemsSnippetThumbnails
        .fromJson,
    (PlaylistItemsSnippetThumbnailsDefault)
        .toString(): PlaylistItemsSnippetThumbnailsDefault.fromJson,
    (PlaylistItemsSnippetThumbnailsMedium)
        .toString(): PlaylistItemsSnippetThumbnailsMedium.fromJson,
    (PlaylistItemsSnippetThumbnailsHigh)
        .toString(): PlaylistItemsSnippetThumbnailsHigh.fromJson,
    (PlaylistItemsSnippetThumbnailsStandard)
        .toString(): PlaylistItemsSnippetThumbnailsStandard.fromJson,
    (PlaylistItemsSnippetThumbnailsMaxres)
        .toString(): PlaylistItemsSnippetThumbnailsMaxres.fromJson,
    (PlaylistItemsSnippetResourceId).toString(): PlaylistItemsSnippetResourceId
        .fromJson,
    (PlaylistItemsContentDetails).toString(): PlaylistItemsContentDetails
        .fromJson,
    (PlaylistItemsStatus).toString(): PlaylistItemsStatus.fromJson,
    (PlaylistPageInfo).toString(): PlaylistPageInfo.fromJson,
    (ProgramScheduleEntity).toString(): ProgramScheduleEntity.fromJson,
    (ProgramSchedulePrograms).toString(): ProgramSchedulePrograms.fromJson,
    (SectionDataEntity).toString(): SectionDataEntity.fromJson,
    (SectionDataData).toString(): SectionDataData.fromJson,
    (SectionDataLatestData).toString(): SectionDataLatestData.fromJson,
    (SectionDataMostViewed).toString(): SectionDataMostViewed.fromJson,
    (WriterEntity).toString(): WriterEntity.fromJson,
    (WriterWriter).toString(): WriterWriter.fromJson,
    (WriterArticles).toString(): WriterArticles.fromJson,
    (WriterArticlesResources).toString(): WriterArticlesResources.fromJson,
    (SettingEntity).toString(): SettingEntity.fromJson,
    (NewsEntity).toString(): NewsEntity.fromJson,
    (NewsCategory).toString(): NewsCategory.fromJson,
    (NewsKeywords).toString(): NewsKeywords.fromJson,
    (NewsExtras).toString(): NewsExtras.fromJson,
    (ProgramEntity).toString(): ProgramEntity.fromJson,
    (ProgramPrograms).toString(): ProgramPrograms.fromJson,
    (SectionEntity).toString(): SectionEntity.fromJson,
    (SectionSections).toString(): SectionSections.fromJson,
    (SectionSectionsCategories).toString(): SectionSectionsCategories.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}