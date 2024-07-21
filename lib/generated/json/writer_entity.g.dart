import 'package:yemenshabab_news_cms_mobile/generated/json/base/json_convert_content.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/writer_entity.dart';

WriterEntity $WriterEntityFromJson(Map<String, dynamic> json) {
  final WriterEntity writerEntity = WriterEntity();
  final WriterWriter? writer = jsonConvert.convert<WriterWriter>(
      json['writer']);
  if (writer != null) {
    writerEntity.writer = writer;
  }
  final WriterArticles? articles = jsonConvert.convert<WriterArticles>(
      json['articles']);
  if (articles != null) {
    writerEntity.articles = articles;
  }
  return writerEntity;
}

Map<String, dynamic> $WriterEntityToJson(WriterEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['writer'] = entity.writer?.toJson();
  data['articles'] = entity.articles?.toJson();
  return data;
}

extension WriterEntityExtension on WriterEntity {
  WriterEntity copyWith({
    WriterWriter? writer,
    WriterArticles? articles,
  }) {
    return WriterEntity()
      ..writer = writer ?? this.writer
      ..articles = articles ?? this.articles;
  }
}

WriterWriter $WriterWriterFromJson(Map<String, dynamic> json) {
  final WriterWriter writerWriter = WriterWriter();
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    writerWriter.uuid = uuid;
  }
  final String? firstName = jsonConvert.convert<String>(json['firstName']);
  if (firstName != null) {
    writerWriter.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['lastName']);
  if (lastName != null) {
    writerWriter.lastName = lastName;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    writerWriter.email = email;
  }
  final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
  if (enabled != null) {
    writerWriter.enabled = enabled;
  }
  final String? creationDate = jsonConvert.convert<String>(
      json['creationDate']);
  if (creationDate != null) {
    writerWriter.creationDate = creationDate;
  }
  final String? createdBy = jsonConvert.convert<String>(json['createdBy']);
  if (createdBy != null) {
    writerWriter.createdBy = createdBy;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    writerWriter.image = image;
  }
  final String? writerType = jsonConvert.convert<String>(json['writerType']);
  if (writerType != null) {
    writerWriter.writerType = writerType;
  }
  final String? lastModificationDate = jsonConvert.convert<String>(
      json['lastModificationDate']);
  if (lastModificationDate != null) {
    writerWriter.lastModificationDate = lastModificationDate;
  }
  final String? modifiedBy = jsonConvert.convert<String>(json['modifiedBy']);
  if (modifiedBy != null) {
    writerWriter.modifiedBy = modifiedBy;
  }
  final String? facebook = jsonConvert.convert<String>(json['facebook']);
  if (facebook != null) {
    writerWriter.facebook = facebook;
  }
  final String? twitter = jsonConvert.convert<String>(json['twitter']);
  if (twitter != null) {
    writerWriter.twitter = twitter;
  }
  final String? linkedin = jsonConvert.convert<String>(json['linkedin']);
  if (linkedin != null) {
    writerWriter.linkedin = linkedin;
  }
  final String? telegram = jsonConvert.convert<String>(json['telegram']);
  if (telegram != null) {
    writerWriter.telegram = telegram;
  }
  final String? instagram = jsonConvert.convert<String>(json['instagram']);
  if (instagram != null) {
    writerWriter.instagram = instagram;
  }
  final bool? showLinks = jsonConvert.convert<bool>(json['showLinks']);
  if (showLinks != null) {
    writerWriter.showLinks = showLinks;
  }
  final String? firstNameEn = jsonConvert.convert<String>(json['firstNameEn']);
  if (firstNameEn != null) {
    writerWriter.firstNameEn = firstNameEn;
  }
  final String? lastNameEn = jsonConvert.convert<String>(json['lastNameEn']);
  if (lastNameEn != null) {
    writerWriter.lastNameEn = lastNameEn;
  }
  return writerWriter;
}

Map<String, dynamic> $WriterWriterToJson(WriterWriter entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['firstName'] = entity.firstName;
  data['lastName'] = entity.lastName;
  data['email'] = entity.email;
  data['enabled'] = entity.enabled;
  data['creationDate'] = entity.creationDate;
  data['createdBy'] = entity.createdBy;
  data['image'] = entity.image;
  data['writerType'] = entity.writerType;
  data['lastModificationDate'] = entity.lastModificationDate;
  data['modifiedBy'] = entity.modifiedBy;
  data['facebook'] = entity.facebook;
  data['twitter'] = entity.twitter;
  data['linkedin'] = entity.linkedin;
  data['telegram'] = entity.telegram;
  data['instagram'] = entity.instagram;
  data['showLinks'] = entity.showLinks;
  data['firstNameEn'] = entity.firstNameEn;
  data['lastNameEn'] = entity.lastNameEn;
  return data;
}

extension WriterWriterExtension on WriterWriter {
  WriterWriter copyWith({
    String? uuid,
    String? firstName,
    String? lastName,
    String? email,
    bool? enabled,
    String? creationDate,
    String? createdBy,
    String? image,
    String? writerType,
    String? lastModificationDate,
    String? modifiedBy,
    String? facebook,
    String? twitter,
    String? linkedin,
    String? telegram,
    String? instagram,
    bool? showLinks,
    String? firstNameEn,
    String? lastNameEn,
  }) {
    return WriterWriter()
      ..uuid = uuid ?? this.uuid
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..email = email ?? this.email
      ..enabled = enabled ?? this.enabled
      ..creationDate = creationDate ?? this.creationDate
      ..createdBy = createdBy ?? this.createdBy
      ..image = image ?? this.image
      ..writerType = writerType ?? this.writerType
      ..lastModificationDate = lastModificationDate ?? this.lastModificationDate
      ..modifiedBy = modifiedBy ?? this.modifiedBy
      ..facebook = facebook ?? this.facebook
      ..twitter = twitter ?? this.twitter
      ..linkedin = linkedin ?? this.linkedin
      ..telegram = telegram ?? this.telegram
      ..instagram = instagram ?? this.instagram
      ..showLinks = showLinks ?? this.showLinks
      ..firstNameEn = firstNameEn ?? this.firstNameEn
      ..lastNameEn = lastNameEn ?? this.lastNameEn;
  }
}

WriterArticles $WriterArticlesFromJson(Map<String, dynamic> json) {
  final WriterArticles writerArticles = WriterArticles();
  final List<WriterArticlesResources>? resources = (json['resources'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<WriterArticlesResources>(
          e) as WriterArticlesResources).toList();
  if (resources != null) {
    writerArticles.resources = resources;
  }
  final String? totalRecords = jsonConvert.convert<String>(
      json['totalRecords']);
  if (totalRecords != null) {
    writerArticles.totalRecords = totalRecords;
  }
  return writerArticles;
}

Map<String, dynamic> $WriterArticlesToJson(WriterArticles entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['resources'] = entity.resources?.map((v) => v.toJson()).toList();
  data['totalRecords'] = entity.totalRecords;
  return data;
}

extension WriterArticlesExtension on WriterArticles {
  WriterArticles copyWith({
    List<WriterArticlesResources>? resources,
    String? totalRecords,
  }) {
    return WriterArticles()
      ..resources = resources ?? this.resources
      ..totalRecords = totalRecords ?? this.totalRecords;
  }
}

WriterArticlesResources $WriterArticlesResourcesFromJson(
    Map<String, dynamic> json) {
  final WriterArticlesResources writerArticlesResources = WriterArticlesResources();
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    writerArticlesResources.uuid = uuid;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    writerArticlesResources.image = image;
  }
  final String? titleAr = jsonConvert.convert<String>(json['titleAr']);
  if (titleAr != null) {
    writerArticlesResources.titleAr = titleAr;
  }
  final String? titleEn = jsonConvert.convert<String>(json['titleEn']);
  if (titleEn != null) {
    writerArticlesResources.titleEn = titleEn;
  }
  final String? descriptionAr = jsonConvert.convert<String>(
      json['descriptionAr']);
  if (descriptionAr != null) {
    writerArticlesResources.descriptionAr = descriptionAr;
  }
  final String? descriptionEn = jsonConvert.convert<String>(
      json['descriptionEn']);
  if (descriptionEn != null) {
    writerArticlesResources.descriptionEn = descriptionEn;
  }
  final String? creationDate = jsonConvert.convert<String>(
      json['creationDate']);
  if (creationDate != null) {
    writerArticlesResources.creationDate = creationDate;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    writerArticlesResources.category = category;
  }
  final String? categoryId = jsonConvert.convert<String>(json['categoryId']);
  if (categoryId != null) {
    writerArticlesResources.categoryId = categoryId;
  }
  final String? categoryAr = jsonConvert.convert<String>(json['categoryAr']);
  if (categoryAr != null) {
    writerArticlesResources.categoryAr = categoryAr;
  }
  final String? categoryColor = jsonConvert.convert<String>(
      json['categoryColor']);
  if (categoryColor != null) {
    writerArticlesResources.categoryColor = categoryColor;
  }
  final String? section = jsonConvert.convert<String>(json['section']);
  if (section != null) {
    writerArticlesResources.section = section;
  }
  final String? writerImage = jsonConvert.convert<String>(json['writerImage']);
  if (writerImage != null) {
    writerArticlesResources.writerImage = writerImage;
  }
  final String? writerName = jsonConvert.convert<String>(json['writerName']);
  if (writerName != null) {
    writerArticlesResources.writerName = writerName;
  }
  final String? sourceAr = jsonConvert.convert<String>(json['sourceAr']);
  if (sourceAr != null) {
    writerArticlesResources.sourceAr = sourceAr;
  }
  final String? sourceEn = jsonConvert.convert<String>(json['sourceEn']);
  if (sourceEn != null) {
    writerArticlesResources.sourceEn = sourceEn;
  }
  return writerArticlesResources;
}

Map<String, dynamic> $WriterArticlesResourcesToJson(
    WriterArticlesResources entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['image'] = entity.image;
  data['titleAr'] = entity.titleAr;
  data['titleEn'] = entity.titleEn;
  data['descriptionAr'] = entity.descriptionAr;
  data['descriptionEn'] = entity.descriptionEn;
  data['creationDate'] = entity.creationDate;
  data['category'] = entity.category;
  data['categoryId'] = entity.categoryId;
  data['categoryAr'] = entity.categoryAr;
  data['categoryColor'] = entity.categoryColor;
  data['section'] = entity.section;
  data['writerImage'] = entity.writerImage;
  data['writerName'] = entity.writerName;
  data['sourceAr'] = entity.sourceAr;
  data['sourceEn'] = entity.sourceEn;
  return data;
}

extension WriterArticlesResourcesExtension on WriterArticlesResources {
  WriterArticlesResources copyWith({
    String? uuid,
    String? image,
    String? titleAr,
    String? titleEn,
    String? descriptionAr,
    String? descriptionEn,
    String? creationDate,
    String? category,
    String? categoryId,
    String? categoryAr,
    String? categoryColor,
    String? section,
    String? writerImage,
    String? writerName,
    String? sourceAr,
    String? sourceEn,
  }) {
    return WriterArticlesResources()
      ..uuid = uuid ?? this.uuid
      ..image = image ?? this.image
      ..titleAr = titleAr ?? this.titleAr
      ..titleEn = titleEn ?? this.titleEn
      ..descriptionAr = descriptionAr ?? this.descriptionAr
      ..descriptionEn = descriptionEn ?? this.descriptionEn
      ..creationDate = creationDate ?? this.creationDate
      ..category = category ?? this.category
      ..categoryId = categoryId ?? this.categoryId
      ..categoryAr = categoryAr ?? this.categoryAr
      ..categoryColor = categoryColor ?? this.categoryColor
      ..section = section ?? this.section
      ..writerImage = writerImage ?? this.writerImage
      ..writerName = writerName ?? this.writerName
      ..sourceAr = sourceAr ?? this.sourceAr
      ..sourceEn = sourceEn ?? this.sourceEn;
  }
}