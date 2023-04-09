import 'package:flutter/material.dart';
import 'package:lab4/models/post_model.dart';

class CommentPage extends StatelessWidget {
  const CommentPage(
      {Key? key, required this.postModel, required this.likeCallBack})
      : super(key: key);
  final PostModel postModel;
  final Function likeCallBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "В ответ ${postModel.userName}",
            style: const TextStyle(fontSize: 16, color: Colors.blue),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    width: 60,
                    height: 60),
              ),
              const SizedBox(width: 15),
              const Text(
                'it will be TextField()',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
