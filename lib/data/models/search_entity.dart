import 'package:yemenshabab/generated/json/base/json_field.dart';
import 'package:yemenshabab/generated/json/search_entity.g.dart';
import 'dart:convert';
export 'package:yemenshabab/generated/json/search_entity.g.dart';

@JsonSerializable()
class SearchEntity {
	List<SearchSearchItems>? searchItems;
	String? totalRecords;

	SearchEntity();

	factory SearchEntity.fromJson(Map<String, dynamic> json) => $SearchEntityFromJson(json);

	Map<String, dynamic> toJson() => $SearchEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SearchSearchItems {
	String? titleEn;
	String? titleAr;
	String? subtitleEn;
	String? subtitleAr;
	String? route;

	SearchSearchItems();

	factory SearchSearchItems.fromJson(Map<String, dynamic> json) => $SearchSearchItemsFromJson(json);

	Map<String, dynamic> toJson() => $SearchSearchItemsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}