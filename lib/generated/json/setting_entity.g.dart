import 'package:yemenshabab_news_cms_mobile/generated/json/base/json_convert_content.dart';
import 'package:yemenshabab_news_cms_mobile/services/app/models/setting_entity.dart';

SettingEntity $SettingEntityFromJson(Map<String, dynamic> json) {
  final SettingEntity settingEntity = SettingEntity();
  final String? siteName = jsonConvert.convert<String>(json['siteName']);
  if (siteName != null) {
    settingEntity.siteName = siteName;
  }
  final String? siteEmail = jsonConvert.convert<String>(json['siteEmail']);
  if (siteEmail != null) {
    settingEntity.siteEmail = siteEmail;
  }
  final String? siteTags = jsonConvert.convert<String>(json['siteTags']);
  if (siteTags != null) {
    settingEntity.siteTags = siteTags;
  }
  final String? siteDescription = jsonConvert.convert<String>(
      json['siteDescription']);
  if (siteDescription != null) {
    settingEntity.siteDescription = siteDescription;
  }
  final String? contactUs = jsonConvert.convert<String>(json['contactUs']);
  if (contactUs != null) {
    settingEntity.contactUs = contactUs;
  }
  final String? facebook = jsonConvert.convert<String>(json['facebook']);
  if (facebook != null) {
    settingEntity.facebook = facebook;
  }
  final String? twitter = jsonConvert.convert<String>(json['twitter']);
  if (twitter != null) {
    settingEntity.twitter = twitter;
  }
  final String? youtube = jsonConvert.convert<String>(json['youtube']);
  if (youtube != null) {
    settingEntity.youtube = youtube;
  }
  final String? telegram = jsonConvert.convert<String>(json['telegram']);
  if (telegram != null) {
    settingEntity.telegram = telegram;
  }
  final String? instagram = jsonConvert.convert<String>(json['instagram']);
  if (instagram != null) {
    settingEntity.instagram = instagram;
  }
  final String? liveStreamUrl = jsonConvert.convert<String>(
      json['liveStreamUrl']);
  if (liveStreamUrl != null) {
    settingEntity.liveStreamUrl = liveStreamUrl;
  }
  final String? radioLiveStream = jsonConvert.convert<String>(
      json['radioLiveStream']);
  if (radioLiveStream != null) {
    settingEntity.radioLiveStream = radioLiveStream;
  }
  final String? creationDate = jsonConvert.convert<String>(
      json['creationDate']);
  if (creationDate != null) {
    settingEntity.creationDate = creationDate;
  }
  final String? siteDescriptionEn = jsonConvert.convert<String>(
      json['siteDescriptionEn']);
  if (siteDescriptionEn != null) {
    settingEntity.siteDescriptionEn = siteDescriptionEn;
  }
  final String? contactUsEn = jsonConvert.convert<String>(json['contactUsEn']);
  if (contactUsEn != null) {
    settingEntity.contactUsEn = contactUsEn;
  }
  final String? siteNameEn = jsonConvert.convert<String>(json['siteNameEn']);
  if (siteNameEn != null) {
    settingEntity.siteNameEn = siteNameEn;
  }
  final String? googlePlay = jsonConvert.convert<String>(json['googlePlay']);
  if (googlePlay != null) {
    settingEntity.googlePlay = googlePlay;
  }
  final String? appStore = jsonConvert.convert<String>(json['appStore']);
  if (appStore != null) {
    settingEntity.appStore = appStore;
  }
  return settingEntity;
}

Map<String, dynamic> $SettingEntityToJson(SettingEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['siteName'] = entity.siteName;
  data['siteEmail'] = entity.siteEmail;
  data['siteTags'] = entity.siteTags;
  data['siteDescription'] = entity.siteDescription;
  data['contactUs'] = entity.contactUs;
  data['facebook'] = entity.facebook;
  data['twitter'] = entity.twitter;
  data['youtube'] = entity.youtube;
  data['telegram'] = entity.telegram;
  data['instagram'] = entity.instagram;
  data['liveStreamUrl'] = entity.liveStreamUrl;
  data['radioLiveStream'] = entity.radioLiveStream;
  data['creationDate'] = entity.creationDate;
  data['siteDescriptionEn'] = entity.siteDescriptionEn;
  data['contactUsEn'] = entity.contactUsEn;
  data['siteNameEn'] = entity.siteNameEn;
  data['googlePlay'] = entity.googlePlay;
  data['appStore'] = entity.appStore;
  return data;
}

extension SettingEntityExtension on SettingEntity {
  SettingEntity copyWith({
    String? siteName,
    String? siteEmail,
    String? siteTags,
    String? siteDescription,
    String? contactUs,
    String? facebook,
    String? twitter,
    String? youtube,
    String? telegram,
    String? instagram,
    String? liveStreamUrl,
    String? radioLiveStream,
    String? creationDate,
    String? siteDescriptionEn,
    String? contactUsEn,
    String? siteNameEn,
    String? googlePlay,
    String? appStore,
  }) {
    return SettingEntity()
      ..siteName = siteName ?? this.siteName
      ..siteEmail = siteEmail ?? this.siteEmail
      ..siteTags = siteTags ?? this.siteTags
      ..siteDescription = siteDescription ?? this.siteDescription
      ..contactUs = contactUs ?? this.contactUs
      ..facebook = facebook ?? this.facebook
      ..twitter = twitter ?? this.twitter
      ..youtube = youtube ?? this.youtube
      ..telegram = telegram ?? this.telegram
      ..instagram = instagram ?? this.instagram
      ..liveStreamUrl = liveStreamUrl ?? this.liveStreamUrl
      ..radioLiveStream = radioLiveStream ?? this.radioLiveStream
      ..creationDate = creationDate ?? this.creationDate
      ..siteDescriptionEn = siteDescriptionEn ?? this.siteDescriptionEn
      ..contactUsEn = contactUsEn ?? this.contactUsEn
      ..siteNameEn = siteNameEn ?? this.siteNameEn
      ..googlePlay = googlePlay ?? this.googlePlay
      ..appStore = appStore ?? this.appStore;
  }
}