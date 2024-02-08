class ChatModel {
  final String avatarUrl;
  final String name;
  final String datetime;
  final String message;

  ChatModel({
    required this.avatarUrl,
    required this.name,
    required this.datetime,
    required this.message,
  });

  static List<ChatModel> dummyData = [
    ChatModel(
      avatarUrl:
          'https://static.wixstatic.com/media/6fa157_c8a4aaf54fe14c47876c159a77b5882d~mv2.jpg/v1/fill/w_717,h_717,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/background%20photo_edited.jpg',
      name: 'Lance',
      datetime: '10:00 AM',
      message: 'good morning!',
    ),
    ChatModel(
      avatarUrl:
          'https://raw.githubusercontent.com/DARRICK1103/My-portfolio/main/image/darrick10.jpg',
      name: 'Darrick',
      datetime: 'Yesterday',
      message: 'Hi are you available?',
    ),
  ];
}
