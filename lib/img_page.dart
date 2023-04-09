import 'package:flutter/material.dart';

import 'models/post_model.dart';

class ImgPage extends StatelessWidget {
  const ImgPage({Key? key, required this.postModel}) : super(key: key);
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: '${postModel.postImage} ${postModel.userName}',
          child: Image.network(postModel.postImage!),
        ),
      ),
    );
  }
}
