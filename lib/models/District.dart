class District {
    bool success;
    String message;
    List<Datum> data;

    District({
        required this.success,
        required this.message,
        required this.data,
    });
factory District.fromJson(Map<String, dynamic> json) {
    return District(
      success: json['success'],
      message: json['message'],
      data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  int id;
  int divisionId;
  String name;
  DateTime createdAt; // Change this
  DateTime updatedAt; // Change this
  Division division;

  Datum({
      required this.id,
      required this.divisionId,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.division,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      divisionId: json['division_id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      division: Division.fromJson(json['division']),
    );
  }
}


class Division {
    int id;
    String name;
    dynamic createdAt;
    dynamic updatedAt;

    Division({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
    });
     factory Division.fromJson(Map<String, dynamic> json) {
    return Division(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

}
