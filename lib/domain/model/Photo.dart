// ignore_for_file: public_member_api_docs, sort_constructors_first
class Photo {
  Photo({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageURL,
  });
  late final int id;
  late final String pageURL;
  late final String type;
  late final String tags;
  late final String previewURL;
  late final int previewWidth;
  late final int previewHeight;
  late final String webformatURL;
  late final int webformatWidth;
  late final int webformatHeight;
  late final String largeImageURL;
  late final int imageWidth;
  late final int imageHeight;
  late final int imageSize;
  late final int views;
  late final int downloads;
  late final int collections;
  late final int likes;
  late final int comments;
  late final int userId;
  late final String user;
  late final String userImageURL;

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageURL = json['pageURL'];
    type = json['type'];
    tags = json['tags'];
    previewURL = json['previewURL'];
    previewWidth = json['previewWidth'];
    previewHeight = json['previewHeight'];
    webformatURL = json['webformatURL'];
    webformatWidth = json['webformatWidth'];
    webformatHeight = json['webformatHeight'];
    largeImageURL = json['largeImageURL'];
    imageWidth = json['imageWidth'];
    imageHeight = json['imageHeight'];
    imageSize = json['imageSize'];
    views = json['views'];
    downloads = json['downloads'];
    collections = json['collections'];
    likes = json['likes'];
    comments = json['comments'];
    userId = json['user_id'];
    user = json['user'];
    userImageURL = json['userImageURL'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pageURL'] = pageURL;
    _data['type'] = type;
    _data['tags'] = tags;
    _data['previewURL'] = previewURL;
    _data['previewWidth'] = previewWidth;
    _data['previewHeight'] = previewHeight;
    _data['webformatURL'] = webformatURL;
    _data['webformatWidth'] = webformatWidth;
    _data['webformatHeight'] = webformatHeight;
    _data['largeImageURL'] = largeImageURL;
    _data['imageWidth'] = imageWidth;
    _data['imageHeight'] = imageHeight;
    _data['imageSize'] = imageSize;
    _data['views'] = views;
    _data['downloads'] = downloads;
    _data['collections'] = collections;
    _data['likes'] = likes;
    _data['comments'] = comments;
    _data['user_id'] = userId;
    _data['user'] = user;
    _data['userImageURL'] = userImageURL;
    return _data;
  }

  @override
  bool operator ==(covariant Photo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.pageURL == pageURL &&
        other.type == type &&
        other.tags == tags &&
        other.previewURL == previewURL &&
        other.previewWidth == previewWidth &&
        other.previewHeight == previewHeight &&
        other.webformatURL == webformatURL &&
        other.webformatWidth == webformatWidth &&
        other.webformatHeight == webformatHeight &&
        other.largeImageURL == largeImageURL &&
        other.imageWidth == imageWidth &&
        other.imageHeight == imageHeight &&
        other.imageSize == imageSize &&
        other.views == views &&
        other.downloads == downloads &&
        other.collections == collections &&
        other.likes == likes &&
        other.comments == comments &&
        other.userId == userId &&
        other.user == user &&
        other.userImageURL == userImageURL;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        pageURL.hashCode ^
        type.hashCode ^
        tags.hashCode ^
        previewURL.hashCode ^
        previewWidth.hashCode ^
        previewHeight.hashCode ^
        webformatURL.hashCode ^
        webformatWidth.hashCode ^
        webformatHeight.hashCode ^
        largeImageURL.hashCode ^
        imageWidth.hashCode ^
        imageHeight.hashCode ^
        imageSize.hashCode ^
        views.hashCode ^
        downloads.hashCode ^
        collections.hashCode ^
        likes.hashCode ^
        comments.hashCode ^
        userId.hashCode ^
        user.hashCode ^
        userImageURL.hashCode;
  }

  @override
  String toString() {
    return 'Photo(id: $id)';
  }
}
