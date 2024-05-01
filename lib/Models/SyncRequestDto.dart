import 'dart:convert';

import 'package:mi_agro_app/Models/Database/Todo.dart';

class SyncRequestDto {
  late String id = "";
  final List<Body> body = [];

  SyncRequestDto(String id){
    this.id = id;
  }

  setBody(Todo value){
    Body bodyValue = Body(
      id: value.id,
      body: value.body,
      title: value.title,
      date: value.date,
      deleted: value.deleted
    );

    body.add(bodyValue);
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    'body': body.map((e) => e.toJson()).toList(),
  };


}

class Body {
  final String id;
  final String title;
  final String body;
  final String date;
  final int deleted;

  Body({required this.id, required this.title, required this.body, required this.date, required this.deleted});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      date: json['date'],
      deleted: json['deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'date': date,
      'deleted': deleted,
    };
  }
}