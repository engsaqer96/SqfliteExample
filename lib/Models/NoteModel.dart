class NoteModel {
  int? id,is_complete;
  String? title,des;
  NoteModel({
    this.id,
    this.is_complete,
    this.title,
    this.des,
  });

  Map<String, dynamic> toMap() {
    return {
      // this.id
      // 'id': this.id,
      'is_complete': this.is_complete,
      'title': this.title,
      'des': this.des,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] as int,
      is_complete: map['is_complete'] as int,
      title: map['title'] as String,
      des: map['des'] as String,
    );
  }
}