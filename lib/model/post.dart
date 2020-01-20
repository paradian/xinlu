class Post {
  Post({
    this.title,
    this.author,
    this.imageUrl,
    this.descript
});
  final String title;
  final String author;
  final String imageUrl;
  final String descript;

  bool selected = false;
}
final List<Post> posts =[
  Post(
    title: 'hello world',
    author:'paradian',
    imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg',
    descript:'this is a flutter list demo,item1'
  ),
  Post(
      title: 'hello flutter',
      author:'leo',
      imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg',
      descript:'this is a flutter list demo,item 2'
  ),
  Post(
      title: 'hello dart',
      author:'mephisto',
      imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg',
      descript:'this is a flutter list demo,item 3'
  )
];