class Seller {
  final bool success;
  final String? message;
  final List<Post> data;

  Seller({
    required this.success,
    this.message,
    required this.data,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      success: json['success'],
      message: json['message'],
      data: List<Post>.from(json['data'].map((x) => Post.fromJson(x))),
    );
  }
}

class Post {
  final int id;
  final int userId;
  final String title;
  final String content;
  final String date;
  final String status;
  final String? createdAt;
  final String? updatedAt;
  final List<File> files;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.date,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.files,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      content: json['content'],
      date: json['date'],
      status: json['status'],
      createdAt: null,
      updatedAt: null,
      files: List<File>.from(json['files'].map((x) => File.fromJson(x))),
    );
  }
}

class File {
  final int id;
  final String url;
  final String fileableType;
  final int fileableId;
  final String fileType;
  final String? createdAt;
  final String? updatedAt;

  File({
    required this.id,
    required this.url,
    required this.fileableType,
    required this.fileableId,
    required this.fileType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory File.fromJson(Map<String, dynamic> json) {
    return File(
      id: json['id'],
      url: json['url'],
      fileableType: json['fileable_type'],
      fileableId: json['fileable_id'],
      fileType: json['file_type'],
      createdAt: null,
      updatedAt: null,
    );
  }
}