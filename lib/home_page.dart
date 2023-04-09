import 'package:flutter/material.dart';
import 'package:lab4/models/post_model.dart';
import 'package:lab4/post.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<PostModel> recomendedPosts = [
    PostModel(
      userName: "user1",
      userNickName: "@user1",
      postImage:
          "https://volyn.tabloyid.com/upload/news/1/2018-08/15336776871/t_1_koti-1.jpg",
      userImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzJuZCKnI8X1adOU6V2VJuYaKb_6mVwrmb_g&usqp=CAU',
      postInfo:
          "У верхньому Row ви використали контейнер кольору бекграунду - правильний підхід, але краще у цьому випадку використати SizedBox, бо він прозорий і підійде під будь яку тему. Також у невидимої іконки не задано size, тому центральний елемент не вирівнявся по центру",
      postComments: 1,
      postShared: 2,
      postLikes: 33,
      postViews: 573,
    ),
    PostModel(
      userName: "user2",
      userNickName: "@user2",
      postImage:
          "https://volyn.tabloyid.com/upload/news/1/2018-08/15336776871/t_1_koti-1.jpg",
      userImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzZEQWC9ccI0JbidGrQLNTUcXYALy3ZmhmpQ&usqp=CAU',
      postInfo:
          "У верхньому Row ви використали контейнер кольору бекграунду - правильний підхід, але краще у цьому випадку використати SizedBox, бо він прозорий і підійде під будь яку тему. Також у невидимої іконки не задано size, тому центральний елемент не вирівнявся по центру",
      postComments: 1,
      postShared: 2,
      postLikes: 33,
      postViews: 573,
    ),
    PostModel(
      userName: "user3",
      userNickName: "@user3",
      postImage:
          "https://volyn.tabloyid.com/upload/news/1/2018-08/15336776871/t_1_koti-1.jpg",
      userImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStwjg5UtRge_buRXOtqzLFUOJJhyFD6lHrjQ&usqp=CAU',
      postInfo:
          "У верхньому Row ви використали контейнер кольору бекграунду - правильний підхід, але краще у цьому випадку використати SizedBox, бо він прозорий і підійде під будь яку тему. Також у невидимої іконки не задано size, тому центральний елемент не вирівнявся по центру",
      postComments: 1,
      postShared: 2,
      postLikes: 33,
      postViews: 573,
    )
  ];
  final List<PostModel> followedPosts = [
    PostModel(
      userName: "user11",
      userNickName: "@user11",
      postImage:
          "https://www.pravmir.ru/wp-content/uploads/2011/05/pikabu.ru_.jpg",
      userImage:
          'https://www.pravmir.ru/wp-content/uploads/2011/05/pikabu.ru_.jpg',
      postInfo:
          "У верхньому Row ви використали контейнер кольору бекграунду - правильний підхід, але краще у цьому випадку використати SizedBox, бо він прозорий і підійде під будь яку тему. Також у невидимої іконки не задано size, тому центральний елемент не вирівнявся по центру",
      postComments: 1,
      postShared: 2,
      postLikes: 33,
      postViews: 573,
    ),
    PostModel(
      userName: "user22",
      userNickName: "@user22",
      postImage:
          "https://volyn.tabloyid.com/upload/news/1/2018-08/15336776871/t_1_koti-1.jpg",
      userImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeJgKK4dBG9uRj0yGrfJejYCWrlDfZt7dAe9Y7Z3-t&s',
      postInfo:
          "У верхньому Row ви використали контейнер кольору бекграунду - правильний підхід, але краще у цьому випадку використати SizedBox, бо він прозорий і підійде під будь яку тему. Також у невидимої іконки не задано size, тому центральний елемент не вирівнявся по центру",
      postComments: 1,
      postShared: 2,
      postLikes: 33,
      postViews: 573,
    ),
    PostModel(
      userName: "user33",
      userNickName: "@user33",
      postImage:
          "https://volyn.tabloyid.com/upload/news/1/2018-08/15336776871/t_1_koti-1.jpg",
      userImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStwjg5UtRge_buRXOtqzLFUOJJhyFD6lHrjQ&usqp=CAU',
      postInfo:
          "У верхньому Row ви використали контейнер кольору бекграунду - правильний підхід, але краще у цьому випадку використати SizedBox, бо він прозорий і підійде під будь яку тему. Також у невидимої іконки не задано size, тому центральний елемент не вирівнявся по центру",
      postComments: 1,
      postShared: 2,
      postLikes: 33,
      postViews: 573,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREv2iK0rk8t7xPQQx_G-SKoUNao4VpV5ywoF6VdVJZZQ&s',
            width: 35,
            height: 35,
          ),
          leading: InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                width: 15,
                height: 15,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Column(
              children: const [
                Divider(),
                TabBar(
                  tabs: [
                    Tab(
                      icon: Text('Для вас',
                          style: TextStyle(color: Colors.black)),
                    ),
                    Tab(
                      icon: Text('Вы читаете',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 25, left: 0, right: 0),
                  child: Column(
                      children: List.generate(
                          recomendedPosts.length,
                          (index) => Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Post(postModel: recomendedPosts[index]),
                              ))),
                ),
              ),
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 25, left: 0, right: 0),
                  child: Column(
                      children: List.generate(
                          followedPosts.length,
                          (index) => Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Post(postModel: followedPosts[index]),
                              ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
