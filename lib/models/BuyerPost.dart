import 'dart:convert';

// File class

// File class
class File {
  int id;
  String url;
  String fileableType;
  int fileableId;
  String fileType;
  DateTime createdAt;
  DateTime updatedAt;

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
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'fileable_type': fileableType,
      'fileable_id': fileableId,
      'file_type': fileType,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

// Post class
class Post {
  int id;
  int userId;
  String title;
  String content;
  DateTime date;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<File> files;

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
    var filesFromJson = json['files'] as List;
    List<File> fileList = filesFromJson.map((fileJson) => File.fromJson(fileJson)).toList();

    return Post(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      content: json['content'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      files: fileList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'files': files.map((file) => file.toJson()).toList(),
    };
  }
}

// Response class
class Buyer {
  bool success;
  String message;
  List<Post> data;

  Buyer({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Buyer.fromJson(Map<String, dynamic> json) {
    var dataFromJson = json['data'] as List;
    List<Post> postList = dataFromJson.map((postJson) => Post.fromJson(postJson)).toList();

    return Buyer(
      success: json['success'],
      message: json['message'],
      data: postList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((post) => post.toJson()).toList(),
    };
  }
}

