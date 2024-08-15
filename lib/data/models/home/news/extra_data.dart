class ExtraData {
  ExtraData({
    String? uuid,
    String? image,
    String? writerNameAr,
    String? writerNameEn,
    String? imageCaptionAr,
    String? imageCaptionEn,
    String? sourceAr,
    String? sourceEn,
  }) {
    _image = image;
    _writerNameEn = writerNameEn;
    _writerNameAr = writerNameAr;
    _imageCaptionAr = imageCaptionAr;
    _imageCaptionEn = imageCaptionEn;
    _sourceAr = sourceAr;
    _uuid = uuid;
    _sourceEn = sourceEn;
  }

  String? _image;
  String? _writerNameAr;
  String? _writerNameEn;
  String? _imageCaptionAr;
  String? _imageCaptionEn;
  String? _sourceAr;
  String? _uuid;
  String? _sourceEn;

  String? get image => _image;

  String? get writerNameAr => _writerNameAr;

  String? get writerNameEn => _writerNameEn;

  String? get imageCaptionAr => _imageCaptionAr;

  String? get imageCaptionEn => _imageCaptionEn;

  String? get sourceAr => _sourceAr;

  String? get uuid => _uuid;

  String? get sourceEn => _sourceEn;
}
