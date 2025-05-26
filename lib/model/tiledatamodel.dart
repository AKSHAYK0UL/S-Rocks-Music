class TileDataModel {
  final String imageBGUrl;
  final String imageLDUrl;
  final String title;
  final String description;

  TileDataModel({
    required this.imageBGUrl,
    required this.imageLDUrl,
    required this.title,
    required this.description,
  });

  factory TileDataModel.fromJson(Map<String, dynamic> json) {
    return TileDataModel(
      imageBGUrl: json['background_image'] ?? '',
      imageLDUrl: json['leading_image'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
