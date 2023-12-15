// ignore_for_file: unnecessary_getters_setters

class CommentModel {
  int _postId = 0;
  int _id = 0;
  String _name = "";
  String _email = "";
  String _body = "";

  CommentModel();

  CommentModel.create(
      this._postId, this._id, this._name, this._email, this._body);

  int get postId => _postId;
  set postId(int postId) => _postId = postId;
  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get body => _body;
  set body(String body) => _body = body;

  CommentModel.fromJson(Map<String, dynamic> json) {
    _postId = json['postId'];
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = _postId;
    data['id'] = _id;
    data['name'] = _name;
    data['email'] = _email;
    data['body'] = _body;
    return data;
  }
}
