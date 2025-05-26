class TileDataModel {
  final String imageBGUrl;
  final String imageLDUrl;
  final String title;
  final String subtitle;

  TileDataModel({
    required this.imageBGUrl,
    required this.imageLDUrl,
    required this.title,
    required this.subtitle,
  });

  factory TileDataModel.fromJson(Map<String, dynamic> json) {
    return TileDataModel(
      imageBGUrl: json['image_bg_url'] ?? '',
      imageLDUrl: json['image_lg_url'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
    );
  }
}
