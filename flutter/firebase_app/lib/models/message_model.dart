// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  DateTime _dateTime = DateTime.now();
  String _text = "";
  String _userId = "";
  String _nickname = "";

  MessageModel(this._text, this._userId, this._nickname);

  DateTime get dateTime => _dateTime;
  set dateTime(DateTime dateTime) => _dateTime = dateTime;
  String get text => _text;
  set text(String text) => _text = text;
  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get nickname => _nickname;
  set nickname(String nickname) => _nickname = nickname;

  MessageModel.fromJson(Map<String, dynamic> json) {
    _dateTime = (json['date_time'] as Timestamp).toDate();
    _text = json['text'];
    _userId = json['user_id'];
    _nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date_time'] = Timestamp.fromDate(_dateTime);
    data['text'] = _text;
    data['user_id'] = _userId;
    data['nickname'] = _nickname;
    return data;
  }
}
