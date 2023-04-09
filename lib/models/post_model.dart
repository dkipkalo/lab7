class PostModel {
  String userName;
  String userNickName;
  String? postImage;
  String? userImage;
  String postInfo;
  int postComments;
  int postShared;
  int postLikes;
  int postViews;

  PostModel(
      {required this.userName,
      required this.userNickName,
      required this.userImage,
      required this.postInfo,
      this.postImage,
      required this.postComments,
      required this.postShared,
      required this.postLikes,
      required this.postViews});
}
