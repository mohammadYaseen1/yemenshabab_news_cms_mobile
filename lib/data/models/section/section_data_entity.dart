import 'package:yemenshabab_news_cms_mobile/generated/json/base/json_field.dart';
import 'package:yemenshabab_news_cms_mobile/generated/json/section_data_entity.g.dart';
import 'dart:convert';
export 'package:yemenshabab_news_cms_mobile/generated/json/section_data_entity.g.dart';

@JsonSerializable()
class SectionDataEntity {
	List<SectionDataData>? data;
	List<SectionDataLatestData>? latestData;
	List<SectionDataMostViewed>? mostViewed;
	String? layoutType;
	String? totalRecords;
	String? color;
	String? categoryAr;

	SectionDataEntity();

	factory SectionDataEntity.fromJson(Map<String, dynamic> json) => $SectionDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $SectionDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SectionDataData {
	String? uuid;
	String? image;
	String? titleAr;
	String? titleEn;
	String? descriptionAr;
	String? descriptionEn;
	String? creationDate;
	String? category;
	String? categoryId;
	String? categoryAr;
	String? categoryColor;
	String? section;
	String? writerImage;
	String? writerName;

	SectionDataData();

	factory SectionDataData.fromJson(Map<String, dynamic> json) => $SectionDataDataFromJson(json);

	Map<String, dynamic> toJson() => $SectionDataDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SectionDataLatestData {
	String? uuid;
	String? image;
	String? titleAr;
	String? titleEn;
	String? descriptionAr;
	String? descriptionEn;
	String? creationDate;
	String? category;
	String? categoryId;
	String? categoryAr;
	String? categoryColor;
	String? section;
	String? writerImage;
	String? writerName;

	SectionDataLatestData();

	factory SectionDataLatestData.fromJson(Map<String, dynamic> json) => $SectionDataLatestDataFromJson(json);

	Map<String, dynamic> toJson() => $SectionDataLatestDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SectionDataMostViewed {
	String? uuid;
	String? image;
	String? titleAr;
	String? titleEn;
	String? descriptionAr;
	String? descriptionEn;
	String? creationDate;
	String? category;
	String? categoryId;
	String? categoryAr;
	String? categoryColor;
	String? section;
	String? writerImage;
	String? writerName;

	SectionDataMostViewed();

	factory SectionDataMostViewed.fromJson(Map<String, dynamic> json) => $SectionDataMostViewedFromJson(json);

	Map<String, dynamic> toJson() => $SectionDataMostViewedToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}