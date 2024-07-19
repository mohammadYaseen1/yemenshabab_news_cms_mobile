import 'package:yemenshabab_news_cms_mobile/generated/json/base/json_convert_content.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/news/news_entity.dart';

NewsEntity $NewsEntityFromJson(Map<String, dynamic> json) {
  final NewsEntity newsEntity = NewsEntity();
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    newsEntity.uuid = uuid;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    newsEntity.image = image;
  }
  final String? creationDate = jsonConvert.convert<String>(
      json['creationDate']);
  if (creationDate != null) {
    newsEntity.creationDate = creationDate;
  }
  final String? views = jsonConvert.convert<String>(json['views']);
  if (views != null) {
    newsEntity.views = views;
  }
  final String? titleAr = jsonConvert.convert<String>(json['titleAr']);
  if (titleAr != null) {
    newsEntity.titleAr = titleAr;
  }
  final String? titleEn = jsonConvert.convert<String>(json['titleEn']);
  if (titleEn != null) {
    newsEntity.titleEn = titleEn;
  }
  final String? descriptionAr = jsonConvert.convert<String>(
      json['descriptionAr']);
  if (descriptionAr != null) {
    newsEntity.descriptionAr = descriptionAr;
  }
  final String? descriptionEn = jsonConvert.convert<String>(
      json['descriptionEn']);
  if (descriptionEn != null) {
    newsEntity.descriptionEn = descriptionEn;
  }
  final String? contentAr = jsonConvert.convert<String>(json['contentAr']);
  if (contentAr != null) {
    newsEntity.contentAr = contentAr;
  }
  final String? contentEn = jsonConvert.convert<String>(json['contentEn']);
  if (contentEn != null) {
    newsEntity.contentEn = contentEn;
  }
  final String? dataType = jsonConvert.convert<String>(json['dataType']);
  if (dataType != null) {
    newsEntity.dataType = dataType;
  }
  final NewsCategory? category = jsonConvert.convert<NewsCategory>(
      json['category']);
  if (category != null) {
    newsEntity.category = category;
  }
  final NewsKeywords? keywords = jsonConvert.convert<NewsKeywords>(
      json['keywords']);
  if (keywords != null) {
    newsEntity.keywords = keywords;
  }
  final NewsExtras? extras = jsonConvert.convert<NewsExtras>(json['extras']);
  if (extras != null) {
    newsEntity.extras = extras;
  }
  return newsEntity;
}

Map<String, dynamic> $NewsEntityToJson(NewsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['image'] = entity.image;
  data['creationDate'] = entity.creationDate;
  data['views'] = entity.views;
  data['titleAr'] = entity.titleAr;
  data['titleEn'] = entity.titleEn;
  data['descriptionAr'] = entity.descriptionAr;
  data['descriptionEn'] = entity.descriptionEn;
  data['contentAr'] = entity.contentAr;
  data['contentEn'] = entity.contentEn;
  data['dataType'] = entity.dataType;
  data['category'] = entity.category?.toJson();
  data['keywords'] = entity.keywords?.toJson();
  data['extras'] = entity.extras?.toJson();
  return data;
}

extension NewsEntityExtension on NewsEntity {
  NewsEntity copyWith({
    String? uuid,
    String? image,
    String? creationDate,
    String? views,
    String? titleAr,
    String? titleEn,
    String? descriptionAr,
    String? descriptionEn,
    String? contentAr,
    String? contentEn,
    String? dataType,
    NewsCategory? category,
    NewsKeywords? keywords,
    NewsExtras? extras,
  }) {
    return NewsEntity()
      ..uuid = uuid ?? this.uuid
      ..image = image ?? this.image
      ..creationDate = creationDate ?? this.creationDate
      ..views = views ?? this.views
      ..titleAr = titleAr ?? this.titleAr
      ..titleEn = titleEn ?? this.titleEn
      ..descriptionAr = descriptionAr ?? this.descriptionAr
      ..descriptionEn = descriptionEn ?? this.descriptionEn
      ..contentAr = contentAr ?? this.contentAr
      ..contentEn = contentEn ?? this.contentEn
      ..dataType = dataType ?? this.dataType
      ..category = category ?? this.category
      ..keywords = keywords ?? this.keywords
      ..extras = extras ?? this.extras;
  }
}

NewsCategory $NewsCategoryFromJson(Map<String, dynamic> json) {
  final NewsCategory newsCategory = NewsCategory();
  final String? nameAr = jsonConvert.convert<String>(json['nameAr']);
  if (nameAr != null) {
    newsCategory.nameAr = nameAr;
  }
  final String? nameEn = jsonConvert.convert<String>(json['nameEn']);
  if (nameEn != null) {
    newsCategory.nameEn = nameEn;
  }
  final String? categoryColor = jsonConvert.convert<String>(
      json['categoryColor']);
  if (categoryColor != null) {
    newsCategory.categoryColor = categoryColor;
  }
  return newsCategory;
}

Map<String, dynamic> $NewsCategoryToJson(NewsCategory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['nameAr'] = entity.nameAr;
  data['nameEn'] = entity.nameEn;
  data['categoryColor'] = entity.categoryColor;
  return data;
}

extension NewsCategoryExtension on NewsCategory {
  NewsCategory copyWith({
    String? nameAr,
    String? nameEn,
    String? categoryColor,
  }) {
    return NewsCategory()
      ..nameAr = nameAr ?? this.nameAr
      ..nameEn = nameEn ?? this.nameEn
      ..categoryColor = categoryColor ?? this.categoryColor;
  }
}

NewsKeywords $NewsKeywordsFromJson(Map<String, dynamic> json) {
  final NewsKeywords newsKeywords = NewsKeywords();
  final List<String>? ar = (json['ar'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (ar != null) {
    newsKeywords.ar = ar;
  }
  final List<String>? en = (json['en'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (en != null) {
    newsKeywords.en = en;
  }
  return newsKeywords;
}

Map<String, dynamic> $NewsKeywordsToJson(NewsKeywords entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ar'] = entity.ar;
  data['en'] = entity.en;
  return data;
}

extension NewsKeywordsExtension on NewsKeywords {
  NewsKeywords copyWith({
    List<String>? ar,
    List<String>? en,
  }) {
    return NewsKeywords()
      ..ar = ar ?? this.ar
      ..en = en ?? this.en;
  }
}

NewsExtras $NewsExtrasFromJson(Map<String, dynamic> json) {
  final NewsExtras newsExtras = NewsExtras();
  final String? imageCaption = jsonConvert.convert<String>(
      json['imageCaption']);
  if (imageCaption != null) {
    newsExtras.imageCaption = imageCaption;
  }
  final String? imageCaptionEn = jsonConvert.convert<String>(
      json['imageCaptionEn']);
  if (imageCaptionEn != null) {
    newsExtras.imageCaptionEn = imageCaptionEn;
  }
  final String? source = jsonConvert.convert<String>(json['source']);
  if (source != null) {
    newsExtras.source = source;
  }
  final String? sourceEn = jsonConvert.convert<String>(json['sourceEn']);
  if (sourceEn != null) {
    newsExtras.sourceEn = sourceEn;
  }
  final String? writerId = jsonConvert.convert<String>(json['writerId']);
  if (writerId != null) {
    newsExtras.writerId = writerId;
  }
  final String? writerImage = jsonConvert.convert<String>(json['writerImage']);
  if (writerImage != null) {
    newsExtras.writerImage = writerImage;
  }
  final String? writerLinks = jsonConvert.convert<String>(json['writerLinks']);
  if (writerLinks != null) {
    newsExtras.writerLinks = writerLinks;
  }
  final String? writerName = jsonConvert.convert<String>(json['writerName']);
  if (writerName != null) {
    newsExtras.writerName = writerName;
  }
  final String? writerNameEn = jsonConvert.convert<String>(
      json['writerNameEn']);
  if (writerNameEn != null) {
    newsExtras.writerNameEn = writerNameEn;
  }
  final String? writerFacebook = jsonConvert.convert<String>(
      json['writerFacebook']);
  if (writerFacebook != null) {
    newsExtras.writerFacebook = writerFacebook;
  }
  final String? writerInstagram = jsonConvert.convert<String>(
      json['writerInstagram']);
  if (writerInstagram != null) {
    newsExtras.writerInstagram = writerInstagram;
  }
  final String? writerLinkedin = jsonConvert.convert<String>(
      json['writerLinkedin']);
  if (writerLinkedin != null) {
    newsExtras.writerLinkedin = writerLinkedin;
  }
  final String? writerTelegram = jsonConvert.convert<String>(
      json['writerTelegram']);
  if (writerTelegram != null) {
    newsExtras.writerTelegram = writerTelegram;
  }
  final String? writerTwitter = jsonConvert.convert<String>(
      json['writerTwitter']);
  if (writerTwitter != null) {
    newsExtras.writerTwitter = writerTwitter;
  }
  return newsExtras;
}

Map<String, dynamic> $NewsExtrasToJson(NewsExtras entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['imageCaption'] = entity.imageCaption;
  data['imageCaptionEn'] = entity.imageCaptionEn;
  data['source'] = entity.source;
  data['sourceEn'] = entity.sourceEn;
  data['writerId'] = entity.writerId;
  data['writerImage'] = entity.writerImage;
  data['writerLinks'] = entity.writerLinks;
  data['writerName'] = entity.writerName;
  data['writerNameEn'] = entity.writerNameEn;
  data['writerFacebook'] = entity.writerFacebook;
  data['writerInstagram'] = entity.writerInstagram;
  data['writerLinkedin'] = entity.writerLinkedin;
  data['writerTelegram'] = entity.writerTelegram;
  data['writerTwitter'] = entity.writerTwitter;
  return data;
}

extension NewsExtrasExtension on NewsExtras {
  NewsExtras copyWith({
    String? imageCaption,
    String? imageCaptionEn,
    String? source,
    String? sourceEn,
    String? writerId,
    String? writerImage,
    String? writerLinks,
    String? writerName,
    String? writerNameEn,
    String? writerFacebook,
    String? writerInstagram,
    String? writerLinkedin,
    String? writerTelegram,
    String? writerTwitter,
  }) {
    return NewsExtras()
      ..imageCaption = imageCaption ?? this.imageCaption
      ..imageCaptionEn = imageCaptionEn ?? this.imageCaptionEn
      ..source = source ?? this.source
      ..sourceEn = sourceEn ?? this.sourceEn
      ..writerId = writerId ?? this.writerId
      ..writerImage = writerImage ?? this.writerImage
      ..writerLinks = writerLinks ?? this.writerLinks
      ..writerName = writerName ?? this.writerName
      ..writerNameEn = writerNameEn ?? this.writerNameEn
      ..writerFacebook = writerFacebook ?? this.writerFacebook
      ..writerInstagram = writerInstagram ?? this.writerInstagram
      ..writerLinkedin = writerLinkedin ?? this.writerLinkedin
      ..writerTelegram = writerTelegram ?? this.writerTelegram
      ..writerTwitter = writerTwitter ?? this.writerTwitter;
  }
}