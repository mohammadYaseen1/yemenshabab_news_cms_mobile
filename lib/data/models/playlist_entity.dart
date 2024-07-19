import 'package:yemenshabab_news_cms_mobile/generated/json/base/json_field.dart';
import 'package:yemenshabab_news_cms_mobile/generated/json/playlist_entity.g.dart';
import 'dart:convert';
export 'package:yemenshabab_news_cms_mobile/generated/json/playlist_entity.g.dart';

@JsonSerializable()
class PlaylistEntity {
	String? kind;
	String? etag;
	String? nextPageToken;
	List<PlaylistItems>? items;
	PlaylistPageInfo? pageInfo;

	PlaylistEntity();

	factory PlaylistEntity.fromJson(Map<String, dynamic> json) => $PlaylistEntityFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistItems {
	String? kind;
	String? etag;
	String? id;
	PlaylistItemsSnippet? snippet;
	PlaylistItemsContentDetails? contentDetails;
	PlaylistItemsStatus? status;

	PlaylistItems();

	factory PlaylistItems.fromJson(Map<String, dynamic> json) => $PlaylistItemsFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistItemsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistItemsSnippet {
	String? publishedAt;
	String? channelId;
	String? title;
	String? description;
	PlaylistItemsSnippetThumbnails? thumbnails;
	String? channelTitle;
	String? playlistId;
	int? position;
	PlaylistItemsSnippetResourceId? resourceId;
	String? videoOwnerChannelTitle;
	String? videoOwnerChannelId;

	PlaylistItemsSnippet();

	factory PlaylistItemsSnippet.fromJson(Map<String, dynamic> json) => $PlaylistItemsSnippetFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistItemsSnippetToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistItemsSnippetThumbnails {
	@JSONField(name: 'default')
	PlaylistItemsSnippetThumbnailsDefault? defaultThumbnail;
	PlaylistItemsSnippetThumbnailsMedium? medium;
	PlaylistItemsSnippetThumbnailsHigh? high;
	PlaylistItemsSnippetThumbnailsStandard? standard;
	PlaylistItemsSnippetThumbnailsMaxres? maxres;

	PlaylistItemsSnippetThumbnails();

	factory PlaylistItemsSnippetThumbnails.fromJson(Map<String, dynamic> json) => $PlaylistItemsSnippetThumbnailsFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistItemsSnippetThumbnailsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistItemsSnippetThumbnailsDefault {
	String? url;
	int? width;
	int? height;

	PlaylistItemsSnippetThumbnailsDefault();

	factory PlaylistItemsSnippetThumbnailsDefault.fromJson(Map<String, dynamic> json) => $PlaylistItemsSnippetThumbnailsDefaultFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistItemsSnippetThumbnailsDefaultToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistItemsSnippetThumbnailsMedium {
	String? url;
	int? width;
	int? height;

	PlaylistItemsSnippetThumbnailsMedium();

	factory PlaylistItemsSnippetThumbnailsMedium.fromJson(Map<String, dynamic> json) => $PlaylistItemsSnippetThumbnailsMediumFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistItemsSnippetThumbnailsMediumToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistItemsSnippetThumbnailsHigh {
	String? url;
	int? width;
	int? height;

	PlaylistItemsSnippetThumbnailsHigh();

	factory PlaylistItemsSnippetThumbnailsHigh.fromJson(Map<String, dynamic> json) => $PlaylistItemsSnippetThumbnailsHighFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistItemsSnippetThumbnailsHighToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistItemsSnippetThumbnailsStandard {
	String? url;
	int? width;
	int? height;

	PlaylistItemsSnippetThumbnailsStandard();

	factory PlaylistItemsSnippetThumbnailsStandard.fromJson(Map<String, dynamic> json) => $PlaylistItemsSnippetThumbnailsStandardFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistItemsSnippetThumbnailsStandardToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistItemsSnippetThumbnailsMaxres {
	String? url;
	int? width;
	int? height;

	PlaylistItemsSnippetThumbnailsMaxres();

	factory PlaylistItemsSnippetThumbnailsMaxres.fromJson(Map<String, dynamic> json) => $PlaylistItemsSnippetThumbnailsMaxresFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistItemsSnippetThumbnailsMaxresToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistItemsSnippetResourceId {
	String? kind;
	String? videoId;

	PlaylistItemsSnippetResourceId();

	factory PlaylistItemsSnippetResourceId.fromJson(Map<String, dynamic> json) => $PlaylistItemsSnippetResourceIdFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistItemsSnippetResourceIdToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistItemsContentDetails {
	String? videoId;
	String? videoPublishedAt;

	PlaylistItemsContentDetails();

	factory PlaylistItemsContentDetails.fromJson(Map<String, dynamic> json) => $PlaylistItemsContentDetailsFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistItemsContentDetailsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistItemsStatus {
	String? privacyStatus;

	PlaylistItemsStatus();

	factory PlaylistItemsStatus.fromJson(Map<String, dynamic> json) => $PlaylistItemsStatusFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistItemsStatusToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PlaylistPageInfo {
	int? totalResults;
	int? resultsPerPage;

	PlaylistPageInfo();

	factory PlaylistPageInfo.fromJson(Map<String, dynamic> json) => $PlaylistPageInfoFromJson(json);

	Map<String, dynamic> toJson() => $PlaylistPageInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}