class Post {
  Post({
    this.title,
    this.author,
    this.imageUrl,
    this.descript,
    this.path,
  });
  final String title;
  final String author;
  final String imageUrl;
  final String descript;
  final String path;

  bool selected = false;
}

final List<Post> posts = [
  Post(
    title: 'hello world',
    author: 'paradian',
    imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg',
    descript: 'this is a flutter list demo,item1',
    path: '/filesystem',
  ),
  Post(
    title: 'hello flutter',
    author: 'leo',
    imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg',
    descript: 'this is a flutter list demo,item 2',
    path: '/formpage',
  ),
  Post(
    title: 'hello dart',
    author: 'mephisto',
    imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg',
    descript: 'this is a flutter list demo,item 3',
    path: '/requestpage',
  )
];
