import 'package:flutter/material.dart';
import 'package:lab4/models/post_model.dart';

import 'comment_page.dart';
import 'img_page.dart';

class MyLikeButton extends StatefulWidget {
  const MyLikeButton({super.key});

  @override
  State<MyLikeButton> createState() => _MyLikeButtonState();
}

class _MyLikeButtonState extends State<MyLikeButton> {
  bool _isRed = false;

  void _switchColor() {
    setState(() {
      _isRed = !_isRed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _switchColor,
      child: Icon(
        Icons.favorite,
        color: _isRed ? Colors.red : Colors.grey,
        size: 20,
      ),
    );
  }
}

class UserPostImage extends StatelessWidget {
  const UserPostImage({Key? key, required this.postModel}) : super(key: key);
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: SizedBox(
        width: 60,
        height: 60,
        child:
            InkWell(onTap: () {}, child: Image.network(postModel.userImage!)),
      ),
    );
  }
}

class PostAppBar extends StatelessWidget {
  const PostAppBar({Key? key, required this.postModel}) : super(key: key);

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          postModel.userName,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          postModel.userNickName,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          "51min",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(
                  0, MediaQuery.of(context).size.height / 2, 0, 0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              items: [
                const PopupMenuItem(
                  child: Text('Мне неинтересен этот твит'),
                ),
                PopupMenuItem(
                  child: Text('Читать пользователя ${postModel.userNickName}'),
                ),
                PopupMenuItem(
                  child: Text(
                      'Игнорировать пользователя ${postModel.userNickName}'),
                ),
                PopupMenuItem(
                  child: Text(
                      'Добавить пользователя ${postModel.userNickName} в близкий круг'),
                ),
                PopupMenuItem(
                  child: Text(
                      'Внести пользователя ${postModel.userNickName} в черный список'),
                ),
                const PopupMenuItem(
                  child: Text('Пожаловаться на твит'),
                ),
              ],
            );
          },
          child: const Icon(
            Icons.more_vert,
            color: Colors.grey,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class PostImageLoop extends StatelessWidget {
  const PostImageLoop({Key? key, required this.postModel}) : super(key: key);
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ImgPage(postModel: postModel),
        ),
      ),
      child: postModel.postImage != null
          ? SizedBox(
              child: Hero(
                tag: '${postModel.postImage} ${postModel.userName}',
                child: Image.network(postModel.postImage!),
              ),
            )
          : const SizedBox(),
    );
  }
}

class PostBottomBar extends StatelessWidget {
  const PostBottomBar({Key? key, required this.postModel}) : super(key: key);

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CommentPage(
                      postModel: postModel,
                      likeCallBack: () {},
                    )),
          ),
          child: const Icon(
            Icons.comment,
            color: Colors.grey,
            size: 20,
          ),
        ),
        Text(
          postModel.postComments.toString(),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.replay,
            color: Colors.grey,
            size: 20,
          ),
        ),
        Text(
          postModel.postShared.toString(),
        ),
        const SizedBox(width: 10),
        MyLikeButton(),
        Text(
          postModel.postLikes.toString(),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.view_stream,
            size: 20,
          ),
        ),
        Text(
          postModel.postViews.toString(),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.assignment,
            color: Colors.grey,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class Post extends StatelessWidget {
  const Post({Key? key, required this.postModel}) : super(key: key);

  final PostModel postModel;

  // final Function callBack;

  @override
  Widget build(BuildContext context) {
    // callBack();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserPostImage(postModel: postModel),
          SizedBox(
            width: MediaQuery.of(context).size.width - 102,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                PostAppBar(postModel: postModel),
                SizedBox(
                    child: Text(
                  postModel.postInfo,
                )),
                const SizedBox(height: 5),
                PostImageLoop(postModel: postModel),
                const SizedBox(height: 10),
                PostBottomBar(postModel: postModel),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
