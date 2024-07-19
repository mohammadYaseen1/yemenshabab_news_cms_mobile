import 'package:yemenshabab_news_cms_mobile/generated/json/base/json_field.dart';
import 'package:yemenshabab_news_cms_mobile/generated/json/setting_entity.g.dart';
import 'dart:convert';
export 'package:yemenshabab_news_cms_mobile/generated/json/setting_entity.g.dart';

@JsonSerializable()
class SettingEntity {
	String? siteName;
	String? siteEmail;
	String? siteTags;
	String? siteDescription;
	String? contactUs;
	String? facebook;
	String? twitter;
	String? youtube;
	String? telegram;
	String? instagram;
	String? liveStreamUrl;
	String? radioLiveStream;
	String? creationDate;
	String? siteDescriptionEn;
	String? contactUsEn;
	String? siteNameEn;
	String? googlePlay;
	String? appStore;

	SettingEntity();

	factory SettingEntity.fromJson(Map<String, dynamic> json) => $SettingEntityFromJson(json);

	Map<String, dynamic> toJson() => $SettingEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}