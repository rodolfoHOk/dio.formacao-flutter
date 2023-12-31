// ignore_for_file: unnecessary_getters_setters

class PostModel {
  int _userId = 0;
  int _id = 0;
  String _title = "";
  String _body = "";

  PostModel();

  PostModel.create(this._userId, this._id, this._title, this._body);

  int get userId => _userId;
  set userId(int userId) => _userId = userId;
  int get id => _id;
  set id(int id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;
  String get body => _body;
  set body(String body) => _body = body;

  PostModel.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = _userId;
    data['id'] = _id;
    data['title'] = _title;
    data['body'] = _body;
    return data;
  }
}
