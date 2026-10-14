class NewsModel {
  final int id;
  final String title;
  final String content;
  final String slug;
  final String summary;
  final String category;
  final String? subcategory;
  final String imageUrl;
  final String authorName;
  final String publishedAt;
  final int views;
  final String status;
  final bool featured;
  final bool breaking;

  const NewsModel({
    required this.id,
    required this.title,
    required this.content,
    required this.slug,
    required this.summary,
    required this.category,
    this.subcategory,
    required this.imageUrl,
    required this.authorName,
    required this.publishedAt,
    required this.views,
    required this.status,
    required this.featured,
    required this.breaking,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    final author = json['author'];

    return NewsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      slug: json['slug'] ?? '',
      summary: json['summary'] ?? '',
      category: json['category'] ?? '',
      subcategory: json['subcategory'],
      imageUrl: json['imageUrl'] ?? '',
      authorName: author is Map
          ? (author['name'] ?? 'India Daily')
          : 'India Daily',
      publishedAt: json['publishedAt'] ?? '',
      views: json['views'] ?? 0,
      status: json['status'] ?? '',
      featured: json['featured'] ?? false,
      breaking: json['breaking'] ?? false,
    );
  }
}
