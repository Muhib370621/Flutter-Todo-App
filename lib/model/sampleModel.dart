// To parse this JSON data, do
//
//     final sample = sampleFromJson(jsonString);
import 'dart:convert';

List<Sample> sampleFromJson(String str) => List<Sample>.from(json.decode(str).map((x) => Sample.fromJson(x)));

String sampleToJson(List<Sample> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sample {
  Sample({
    this.title,
    this.description,
    this.category,
    this.timestamp,
    this.priority,
    this.userId,
    this.isCompleted,
    this.id,
  });

  String? title;
  String? description;
  String? category;
  String? timestamp;
  String? priority;
  String? userId;
  String? isCompleted;
  String? id;

  factory Sample.fromJson(Map<String, dynamic> json) => Sample(
    title: json["title"],
    description: json["description"],
    category: json["category"],
    timestamp: json["timestamp"],
    priority: json["priority"],
    userId: json["user_id"],
    isCompleted: json["isCompleted"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "category": category,
    "timestamp": timestamp,
    "priority": priority,
    "user_id": userId,
    "isCompleted": isCompleted,
    "id": id,
  };
}
