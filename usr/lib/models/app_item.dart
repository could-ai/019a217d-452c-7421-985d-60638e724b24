class AppItem {
  final String name;
  final String iconUrl;
  final String description;
  final String? downloadUrl;
  final int? downloads;
  final double? rating;

  AppItem({
    required this.name,
    required this.iconUrl,
    required this.description,
    this.downloadUrl,
    this.downloads,
    this.rating,
  });

  factory AppItem.fromMap(Map<String, dynamic> map) {
    return AppItem(
      name: map['name'] ?? '',
      iconUrl: map['iconUrl'] ?? '',
      description: map['description'] ?? '',
      downloadUrl: map['downloadUrl'],
      downloads: map['downloads'],
      rating: map['rating']?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'iconUrl': iconUrl,
      'description': description,
      'downloadUrl': downloadUrl,
      'downloads': downloads,
      'rating': rating,
    };
  }
}