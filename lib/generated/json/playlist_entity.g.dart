import 'package:yemenshabab/generated/json/base/json_convert_content.dart';
import 'package:yemenshabab/data/models/playlist_entity.dart';

PlaylistEntity $PlaylistEntityFromJson(Map<String, dynamic> json) {
  final PlaylistEntity playlistEntity = PlaylistEntity();
  final String? kind = jsonConvert.convert<String>(json['kind']);
  if (kind != null) {
    playlistEntity.kind = kind;
  }
  final String? etag = jsonConvert.convert<String>(json['etag']);
  if (etag != null) {
    playlistEntity.etag = etag;
  }
  final String? nextPageToken = jsonConvert.convert<String>(
      json['nextPageToken']);
  if (nextPageToken != null) {
    playlistEntity.nextPageToken = nextPageToken;
  }
  final List<PlaylistItems>? items = (json['items'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<PlaylistItems>(e) as PlaylistItems)
      .toList();
  if (items != null) {
    playlistEntity.items = items;
  }
  final PlaylistPageInfo? pageInfo = jsonConvert.convert<PlaylistPageInfo>(
      json['pageInfo']);
  if (pageInfo != null) {
    playlistEntity.pageInfo = pageInfo;
  }
  return playlistEntity;
}

Map<String, dynamic> $PlaylistEntityToJson(PlaylistEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['kind'] = entity.kind;
  data['etag'] = entity.etag;
  data['nextPageToken'] = entity.nextPageToken;
  data['items'] = entity.items?.map((v) => v.toJson()).toList();
  data['pageInfo'] = entity.pageInfo?.toJson();
  return data;
}

extension PlaylistEntityExtension on PlaylistEntity {
  PlaylistEntity copyWith({
    String? kind,
    String? etag,
    String? nextPageToken,
    List<PlaylistItems>? items,
    PlaylistPageInfo? pageInfo,
  }) {
    return PlaylistEntity()
      ..kind = kind ?? this.kind
      ..etag = etag ?? this.etag
      ..nextPageToken = nextPageToken ?? this.nextPageToken
      ..items = items ?? this.items
      ..pageInfo = pageInfo ?? this.pageInfo;
  }
}

PlaylistItems $PlaylistItemsFromJson(Map<String, dynamic> json) {
  final PlaylistItems playlistItems = PlaylistItems();
  final String? kind = jsonConvert.convert<String>(json['kind']);
  if (kind != null) {
    playlistItems.kind = kind;
  }
  final String? etag = jsonConvert.convert<String>(json['etag']);
  if (etag != null) {
    playlistItems.etag = etag;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    playlistItems.id = id;
  }
  final PlaylistItemsSnippet? snippet = jsonConvert.convert<
      PlaylistItemsSnippet>(json['snippet']);
  if (snippet != null) {
    playlistItems.snippet = snippet;
  }
  final PlaylistItemsContentDetails? contentDetails = jsonConvert.convert<
      PlaylistItemsContentDetails>(json['contentDetails']);
  if (contentDetails != null) {
    playlistItems.contentDetails = contentDetails;
  }
  final PlaylistItemsStatus? status = jsonConvert.convert<PlaylistItemsStatus>(
      json['status']);
  if (status != null) {
    playlistItems.status = status;
  }
  return playlistItems;
}

Map<String, dynamic> $PlaylistItemsToJson(PlaylistItems entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['kind'] = entity.kind;
  data['etag'] = entity.etag;
  data['id'] = entity.id;
  data['snippet'] = entity.snippet?.toJson();
  data['contentDetails'] = entity.contentDetails?.toJson();
  data['status'] = entity.status?.toJson();
  return data;
}

extension PlaylistItemsExtension on PlaylistItems {
  PlaylistItems copyWith({
    String? kind,
    String? etag,
    String? id,
    PlaylistItemsSnippet? snippet,
    PlaylistItemsContentDetails? contentDetails,
    PlaylistItemsStatus? status,
  }) {
    return PlaylistItems()
      ..kind = kind ?? this.kind
      ..etag = etag ?? this.etag
      ..id = id ?? this.id
      ..snippet = snippet ?? this.snippet
      ..contentDetails = contentDetails ?? this.contentDetails
      ..status = status ?? this.status;
  }
}

PlaylistItemsSnippet $PlaylistItemsSnippetFromJson(Map<String, dynamic> json) {
  final PlaylistItemsSnippet playlistItemsSnippet = PlaylistItemsSnippet();
  final String? publishedAt = jsonConvert.convert<String>(json['publishedAt']);
  if (publishedAt != null) {
    playlistItemsSnippet.publishedAt = publishedAt;
  }
  final String? channelId = jsonConvert.convert<String>(json['channelId']);
  if (channelId != null) {
    playlistItemsSnippet.channelId = channelId;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    playlistItemsSnippet.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    playlistItemsSnippet.description = description;
  }
  final PlaylistItemsSnippetThumbnails? thumbnails = jsonConvert.convert<
      PlaylistItemsSnippetThumbnails>(json['thumbnails']);
  if (thumbnails != null) {
    playlistItemsSnippet.thumbnails = thumbnails;
  }
  final String? channelTitle = jsonConvert.convert<String>(
      json['channelTitle']);
  if (channelTitle != null) {
    playlistItemsSnippet.channelTitle = channelTitle;
  }
  final String? playlistId = jsonConvert.convert<String>(json['playlistId']);
  if (playlistId != null) {
    playlistItemsSnippet.playlistId = playlistId;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    playlistItemsSnippet.position = position;
  }
  final PlaylistItemsSnippetResourceId? resourceId = jsonConvert.convert<
      PlaylistItemsSnippetResourceId>(json['resourceId']);
  if (resourceId != null) {
    playlistItemsSnippet.resourceId = resourceId;
  }
  final String? videoOwnerChannelTitle = jsonConvert.convert<String>(
      json['videoOwnerChannelTitle']);
  if (videoOwnerChannelTitle != null) {
    playlistItemsSnippet.videoOwnerChannelTitle = videoOwnerChannelTitle;
  }
  final String? videoOwnerChannelId = jsonConvert.convert<String>(
      json['videoOwnerChannelId']);
  if (videoOwnerChannelId != null) {
    playlistItemsSnippet.videoOwnerChannelId = videoOwnerChannelId;
  }
  return playlistItemsSnippet;
}

Map<String, dynamic> $PlaylistItemsSnippetToJson(PlaylistItemsSnippet entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['publishedAt'] = entity.publishedAt;
  data['channelId'] = entity.channelId;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['thumbnails'] = entity.thumbnails?.toJson();
  data['channelTitle'] = entity.channelTitle;
  data['playlistId'] = entity.playlistId;
  data['position'] = entity.position;
  data['resourceId'] = entity.resourceId?.toJson();
  data['videoOwnerChannelTitle'] = entity.videoOwnerChannelTitle;
  data['videoOwnerChannelId'] = entity.videoOwnerChannelId;
  return data;
}

extension PlaylistItemsSnippetExtension on PlaylistItemsSnippet {
  PlaylistItemsSnippet copyWith({
    String? publishedAt,
    String? channelId,
    String? title,
    String? description,
    PlaylistItemsSnippetThumbnails? thumbnails,
    String? channelTitle,
    String? playlistId,
    int? position,
    PlaylistItemsSnippetResourceId? resourceId,
    String? videoOwnerChannelTitle,
    String? videoOwnerChannelId,
  }) {
    return PlaylistItemsSnippet()
      ..publishedAt = publishedAt ?? this.publishedAt
      ..channelId = channelId ?? this.channelId
      ..title = title ?? this.title
      ..description = description ?? this.description
      ..thumbnails = thumbnails ?? this.thumbnails
      ..channelTitle = channelTitle ?? this.channelTitle
      ..playlistId = playlistId ?? this.playlistId
      ..position = position ?? this.position
      ..resourceId = resourceId ?? this.resourceId
      ..videoOwnerChannelTitle = videoOwnerChannelTitle ??
          this.videoOwnerChannelTitle
      ..videoOwnerChannelId = videoOwnerChannelId ?? this.videoOwnerChannelId;
  }
}

PlaylistItemsSnippetThumbnails $PlaylistItemsSnippetThumbnailsFromJson(
    Map<String, dynamic> json) {
  final PlaylistItemsSnippetThumbnails playlistItemsSnippetThumbnails = PlaylistItemsSnippetThumbnails();
  final PlaylistItemsSnippetThumbnailsDefault? defaultThumbnail = jsonConvert
      .convert<PlaylistItemsSnippetThumbnailsDefault>(json['default']);
  if (defaultThumbnail != null) {
    playlistItemsSnippetThumbnails.defaultThumbnail = defaultThumbnail;
  }
  final PlaylistItemsSnippetThumbnailsMedium? medium = jsonConvert.convert<
      PlaylistItemsSnippetThumbnailsMedium>(json['medium']);
  if (medium != null) {
    playlistItemsSnippetThumbnails.medium = medium;
  }
  final PlaylistItemsSnippetThumbnailsHigh? high = jsonConvert.convert<
      PlaylistItemsSnippetThumbnailsHigh>(json['high']);
  if (high != null) {
    playlistItemsSnippetThumbnails.high = high;
  }
  final PlaylistItemsSnippetThumbnailsStandard? standard = jsonConvert.convert<
      PlaylistItemsSnippetThumbnailsStandard>(json['standard']);
  if (standard != null) {
    playlistItemsSnippetThumbnails.standard = standard;
  }
  final PlaylistItemsSnippetThumbnailsMaxres? maxres = jsonConvert.convert<
      PlaylistItemsSnippetThumbnailsMaxres>(json['maxres']);
  if (maxres != null) {
    playlistItemsSnippetThumbnails.maxres = maxres;
  }
  return playlistItemsSnippetThumbnails;
}

Map<String, dynamic> $PlaylistItemsSnippetThumbnailsToJson(
    PlaylistItemsSnippetThumbnails entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['default'] = entity.defaultThumbnail?.toJson();
  data['medium'] = entity.medium?.toJson();
  data['high'] = entity.high?.toJson();
  data['standard'] = entity.standard?.toJson();
  data['maxres'] = entity.maxres?.toJson();
  return data;
}

extension PlaylistItemsSnippetThumbnailsExtension on PlaylistItemsSnippetThumbnails {
  PlaylistItemsSnippetThumbnails copyWith({
    PlaylistItemsSnippetThumbnailsDefault? defaultThumbnail,
    PlaylistItemsSnippetThumbnailsMedium? medium,
    PlaylistItemsSnippetThumbnailsHigh? high,
    PlaylistItemsSnippetThumbnailsStandard? standard,
    PlaylistItemsSnippetThumbnailsMaxres? maxres,
  }) {
    return PlaylistItemsSnippetThumbnails()
      ..defaultThumbnail = defaultThumbnail ?? this.defaultThumbnail
      ..medium = medium ?? this.medium
      ..high = high ?? this.high
      ..standard = standard ?? this.standard
      ..maxres = maxres ?? this.maxres;
  }
}

PlaylistItemsSnippetThumbnailsDefault $PlaylistItemsSnippetThumbnailsDefaultFromJson(
    Map<String, dynamic> json) {
  final PlaylistItemsSnippetThumbnailsDefault playlistItemsSnippetThumbnailsDefault = PlaylistItemsSnippetThumbnailsDefault();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    playlistItemsSnippetThumbnailsDefault.url = url;
  }
  final int? width = jsonConvert.convert<int>(json['width']);
  if (width != null) {
    playlistItemsSnippetThumbnailsDefault.width = width;
  }
  final int? height = jsonConvert.convert<int>(json['height']);
  if (height != null) {
    playlistItemsSnippetThumbnailsDefault.height = height;
  }
  return playlistItemsSnippetThumbnailsDefault;
}

Map<String, dynamic> $PlaylistItemsSnippetThumbnailsDefaultToJson(
    PlaylistItemsSnippetThumbnailsDefault entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['width'] = entity.width;
  data['height'] = entity.height;
  return data;
}

extension PlaylistItemsSnippetThumbnailsDefaultExtension on PlaylistItemsSnippetThumbnailsDefault {
  PlaylistItemsSnippetThumbnailsDefault copyWith({
    String? url,
    int? width,
    int? height,
  }) {
    return PlaylistItemsSnippetThumbnailsDefault()
      ..url = url ?? this.url
      ..width = width ?? this.width
      ..height = height ?? this.height;
  }
}

PlaylistItemsSnippetThumbnailsMedium $PlaylistItemsSnippetThumbnailsMediumFromJson(
    Map<String, dynamic> json) {
  final PlaylistItemsSnippetThumbnailsMedium playlistItemsSnippetThumbnailsMedium = PlaylistItemsSnippetThumbnailsMedium();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    playlistItemsSnippetThumbnailsMedium.url = url;
  }
  final int? width = jsonConvert.convert<int>(json['width']);
  if (width != null) {
    playlistItemsSnippetThumbnailsMedium.width = width;
  }
  final int? height = jsonConvert.convert<int>(json['height']);
  if (height != null) {
    playlistItemsSnippetThumbnailsMedium.height = height;
  }
  return playlistItemsSnippetThumbnailsMedium;
}

Map<String, dynamic> $PlaylistItemsSnippetThumbnailsMediumToJson(
    PlaylistItemsSnippetThumbnailsMedium entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['width'] = entity.width;
  data['height'] = entity.height;
  return data;
}

extension PlaylistItemsSnippetThumbnailsMediumExtension on PlaylistItemsSnippetThumbnailsMedium {
  PlaylistItemsSnippetThumbnailsMedium copyWith({
    String? url,
    int? width,
    int? height,
  }) {
    return PlaylistItemsSnippetThumbnailsMedium()
      ..url = url ?? this.url
      ..width = width ?? this.width
      ..height = height ?? this.height;
  }
}

PlaylistItemsSnippetThumbnailsHigh $PlaylistItemsSnippetThumbnailsHighFromJson(
    Map<String, dynamic> json) {
  final PlaylistItemsSnippetThumbnailsHigh playlistItemsSnippetThumbnailsHigh = PlaylistItemsSnippetThumbnailsHigh();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    playlistItemsSnippetThumbnailsHigh.url = url;
  }
  final int? width = jsonConvert.convert<int>(json['width']);
  if (width != null) {
    playlistItemsSnippetThumbnailsHigh.width = width;
  }
  final int? height = jsonConvert.convert<int>(json['height']);
  if (height != null) {
    playlistItemsSnippetThumbnailsHigh.height = height;
  }
  return playlistItemsSnippetThumbnailsHigh;
}

Map<String, dynamic> $PlaylistItemsSnippetThumbnailsHighToJson(
    PlaylistItemsSnippetThumbnailsHigh entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['width'] = entity.width;
  data['height'] = entity.height;
  return data;
}

extension PlaylistItemsSnippetThumbnailsHighExtension on PlaylistItemsSnippetThumbnailsHigh {
  PlaylistItemsSnippetThumbnailsHigh copyWith({
    String? url,
    int? width,
    int? height,
  }) {
    return PlaylistItemsSnippetThumbnailsHigh()
      ..url = url ?? this.url
      ..width = width ?? this.width
      ..height = height ?? this.height;
  }
}

PlaylistItemsSnippetThumbnailsStandard $PlaylistItemsSnippetThumbnailsStandardFromJson(
    Map<String, dynamic> json) {
  final PlaylistItemsSnippetThumbnailsStandard playlistItemsSnippetThumbnailsStandard = PlaylistItemsSnippetThumbnailsStandard();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    playlistItemsSnippetThumbnailsStandard.url = url;
  }
  final int? width = jsonConvert.convert<int>(json['width']);
  if (width != null) {
    playlistItemsSnippetThumbnailsStandard.width = width;
  }
  final int? height = jsonConvert.convert<int>(json['height']);
  if (height != null) {
    playlistItemsSnippetThumbnailsStandard.height = height;
  }
  return playlistItemsSnippetThumbnailsStandard;
}

Map<String, dynamic> $PlaylistItemsSnippetThumbnailsStandardToJson(
    PlaylistItemsSnippetThumbnailsStandard entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['width'] = entity.width;
  data['height'] = entity.height;
  return data;
}

extension PlaylistItemsSnippetThumbnailsStandardExtension on PlaylistItemsSnippetThumbnailsStandard {
  PlaylistItemsSnippetThumbnailsStandard copyWith({
    String? url,
    int? width,
    int? height,
  }) {
    return PlaylistItemsSnippetThumbnailsStandard()
      ..url = url ?? this.url
      ..width = width ?? this.width
      ..height = height ?? this.height;
  }
}

PlaylistItemsSnippetThumbnailsMaxres $PlaylistItemsSnippetThumbnailsMaxresFromJson(
    Map<String, dynamic> json) {
  final PlaylistItemsSnippetThumbnailsMaxres playlistItemsSnippetThumbnailsMaxres = PlaylistItemsSnippetThumbnailsMaxres();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    playlistItemsSnippetThumbnailsMaxres.url = url;
  }
  final int? width = jsonConvert.convert<int>(json['width']);
  if (width != null) {
    playlistItemsSnippetThumbnailsMaxres.width = width;
  }
  final int? height = jsonConvert.convert<int>(json['height']);
  if (height != null) {
    playlistItemsSnippetThumbnailsMaxres.height = height;
  }
  return playlistItemsSnippetThumbnailsMaxres;
}

Map<String, dynamic> $PlaylistItemsSnippetThumbnailsMaxresToJson(
    PlaylistItemsSnippetThumbnailsMaxres entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['width'] = entity.width;
  data['height'] = entity.height;
  return data;
}

extension PlaylistItemsSnippetThumbnailsMaxresExtension on PlaylistItemsSnippetThumbnailsMaxres {
  PlaylistItemsSnippetThumbnailsMaxres copyWith({
    String? url,
    int? width,
    int? height,
  }) {
    return PlaylistItemsSnippetThumbnailsMaxres()
      ..url = url ?? this.url
      ..width = width ?? this.width
      ..height = height ?? this.height;
  }
}

PlaylistItemsSnippetResourceId $PlaylistItemsSnippetResourceIdFromJson(
    Map<String, dynamic> json) {
  final PlaylistItemsSnippetResourceId playlistItemsSnippetResourceId = PlaylistItemsSnippetResourceId();
  final String? kind = jsonConvert.convert<String>(json['kind']);
  if (kind != null) {
    playlistItemsSnippetResourceId.kind = kind;
  }
  final String? videoId = jsonConvert.convert<String>(json['videoId']);
  if (videoId != null) {
    playlistItemsSnippetResourceId.videoId = videoId;
  }
  return playlistItemsSnippetResourceId;
}

Map<String, dynamic> $PlaylistItemsSnippetResourceIdToJson(
    PlaylistItemsSnippetResourceId entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['kind'] = entity.kind;
  data['videoId'] = entity.videoId;
  return data;
}

extension PlaylistItemsSnippetResourceIdExtension on PlaylistItemsSnippetResourceId {
  PlaylistItemsSnippetResourceId copyWith({
    String? kind,
    String? videoId,
  }) {
    return PlaylistItemsSnippetResourceId()
      ..kind = kind ?? this.kind
      ..videoId = videoId ?? this.videoId;
  }
}

PlaylistItemsContentDetails $PlaylistItemsContentDetailsFromJson(
    Map<String, dynamic> json) {
  final PlaylistItemsContentDetails playlistItemsContentDetails = PlaylistItemsContentDetails();
  final String? videoId = jsonConvert.convert<String>(json['videoId']);
  if (videoId != null) {
    playlistItemsContentDetails.videoId = videoId;
  }
  final String? videoPublishedAt = jsonConvert.convert<String>(
      json['videoPublishedAt']);
  if (videoPublishedAt != null) {
    playlistItemsContentDetails.videoPublishedAt = videoPublishedAt;
  }
  return playlistItemsContentDetails;
}

Map<String, dynamic> $PlaylistItemsContentDetailsToJson(
    PlaylistItemsContentDetails entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['videoId'] = entity.videoId;
  data['videoPublishedAt'] = entity.videoPublishedAt;
  return data;
}

extension PlaylistItemsContentDetailsExtension on PlaylistItemsContentDetails {
  PlaylistItemsContentDetails copyWith({
    String? videoId,
    String? videoPublishedAt,
  }) {
    return PlaylistItemsContentDetails()
      ..videoId = videoId ?? this.videoId
      ..videoPublishedAt = videoPublishedAt ?? this.videoPublishedAt;
  }
}

PlaylistItemsStatus $PlaylistItemsStatusFromJson(Map<String, dynamic> json) {
  final PlaylistItemsStatus playlistItemsStatus = PlaylistItemsStatus();
  final String? privacyStatus = jsonConvert.convert<String>(
      json['privacyStatus']);
  if (privacyStatus != null) {
    playlistItemsStatus.privacyStatus = privacyStatus;
  }
  return playlistItemsStatus;
}

Map<String, dynamic> $PlaylistItemsStatusToJson(PlaylistItemsStatus entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['privacyStatus'] = entity.privacyStatus;
  return data;
}

extension PlaylistItemsStatusExtension on PlaylistItemsStatus {
  PlaylistItemsStatus copyWith({
    String? privacyStatus,
  }) {
    return PlaylistItemsStatus()
      ..privacyStatus = privacyStatus ?? this.privacyStatus;
  }
}

PlaylistPageInfo $PlaylistPageInfoFromJson(Map<String, dynamic> json) {
  final PlaylistPageInfo playlistPageInfo = PlaylistPageInfo();
  final int? totalResults = jsonConvert.convert<int>(json['totalResults']);
  if (totalResults != null) {
    playlistPageInfo.totalResults = totalResults;
  }
  final int? resultsPerPage = jsonConvert.convert<int>(json['resultsPerPage']);
  if (resultsPerPage != null) {
    playlistPageInfo.resultsPerPage = resultsPerPage;
  }
  return playlistPageInfo;
}

Map<String, dynamic> $PlaylistPageInfoToJson(PlaylistPageInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalResults'] = entity.totalResults;
  data['resultsPerPage'] = entity.resultsPerPage;
  return data;
}

extension PlaylistPageInfoExtension on PlaylistPageInfo {
  PlaylistPageInfo copyWith({
    int? totalResults,
    int? resultsPerPage,
  }) {
    return PlaylistPageInfo()
      ..totalResults = totalResults ?? this.totalResults
      ..resultsPerPage = resultsPerPage ?? this.resultsPerPage;
  }
}