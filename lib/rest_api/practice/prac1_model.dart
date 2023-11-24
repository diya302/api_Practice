// class Album {
//   final int userId;
//   final int id;
//   final String title;
//
//   Album({required this.userId, required this.id, required this.title});
//
//   // factory Album.fromJson(Map<String, dynamic> json) {
//   //   return switch (json) {
//   //     {
//   //     'userId': int userId,
//   //     'id': int id,
//   //     'title': String title,
//   //     } =>
//   //         Album(
//   //           userId: userId,
//   //           id: id,
//   //           title: title,
//   //         ),
//   //     _ => throw const FormatException('Failed to load album.'),
//   //   };
//   // }
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {
//         'userId': int userId,
//         'id': int id,
//         'title': String title,
//       } =>
//         Album(userId: userId, id: id, title: title),
//       _ => throw const FormatException('Failed'),
//     };
//   }
// }

class Album {
  int? userId;
  int? id;
  String? title;

  Album({this.userId, this.id, this.title});

  Album.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
