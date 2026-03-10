import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// MAIN APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FacebookUI(),
    );
  }
}

/// FACEBOOK MAIN SCREEN
class FacebookUI extends StatelessWidget {
  const FacebookUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// FACEBOOK APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "facebook",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.message, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      /// MAIN FEED
      body: ListView(
        children: const [

          CreatePost(),

          Divider(),

          StoriesSection(),

          Divider(),

          PostWidget(
            username: "Angel Rivera",
            profileImage:
            "https://i.pravatar.cc/150?img=1",
            postImage:
            "https://picsum.photos/500/300?random=1",
            caption: "Enjoying Life!",
          ),

          PostWidget(
            username: "Cheo Santos",
            profileImage:
            "https://i.pravatar.cc/150?img=5",
            postImage:
            "https://picsum.photos/500/300?random=2",
            caption: "Love the View!",
          ),

          PostWidget(
            username: "Rea Cruz",
            profileImage:
            "https://i.pravatar.cc/150?img=8",
            postImage:
            "https://picsum.photos/500/300?random=3",
            caption: "Life is beautiful ❤️",
          ),
        ],
      ),
    );
  }
}

/// CREATE POST BOX
class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),

      child: Row(
        children: [

          const CircleAvatar(
            backgroundImage:
            NetworkImage("https://i.pravatar.cc/150?img=10"),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey),
              ),

              child: const Text(
                "What's on your mind?",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// STORIES SECTION
class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  static const List<String> storyImages = [
    "https://picsum.photos/200/300?random=1",
    "https://picsum.photos/200/300?random=2",
    "https://picsum.photos/200/300?random=3",
    "https://picsum.photos/200/300?random=4",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storyImages.length,

        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: const EdgeInsets.all(8),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(storyImages[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

/// POST WIDGET
class PostWidget extends StatefulWidget {
  final String username;
  final String profileImage;
  final String postImage;
  final String caption;

  const PostWidget({
    super.key,
    required this.username,
    required this.profileImage,
    required this.postImage,
    required this.caption,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {

  bool isLiked = false;
  int likeCount = 0;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// PROFILE HEADER
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.profileImage),
            ),
            title: Text(widget.username),
            trailing: const Icon(Icons.more_horiz),
          ),

          /// CAPTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(widget.caption),
          ),

          const SizedBox(height: 10),

          /// POST IMAGE
          Image.network(widget.postImage),

          /// LIKE COUNT
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text("$likeCount likes"),
          ),

          const Divider(),

          /// ACTION BUTTONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              TextButton.icon(
                onPressed: toggleLike,
                icon: Icon(
                  Icons.thumb_up,
                  color: isLiked ? Colors.blue : Colors.grey,
                ),
                label: const Text("Like"),
              ),

              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.comment),
                label: const Text("Comment"),
              ),

              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share),
                label: const Text("Share"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}