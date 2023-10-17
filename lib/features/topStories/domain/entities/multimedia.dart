class Multimedia {
  String url;
  int height;
  int width;
  String caption;
  String copyright;

  Multimedia({
    required this.url,
    required this.height,
    required this.width,
    required this.caption,
    required this.copyright,
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
    url: json["url"],
    height: json["height"],
    width: json["width"],
    caption: json["caption"],
    copyright: json["copyright"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "height": height,
    "width": width,
    "caption": caption,
    "copyright": copyright,
  };
  @override
  String toString() {
    return 'url:$url, height: $height, width: $width, caption: $caption, copyright: $copyright)';
  }
}
