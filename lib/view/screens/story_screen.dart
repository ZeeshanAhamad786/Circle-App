import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:story/story_page_view.dart';

class User {
  final String imageUrl;
  final String userName;
  final List<Story> stories;

  User({
    required this.imageUrl,
    required this.userName,
    required this.stories,
  });
}

class Story {
  final String imageUrl;

  Story({required this.imageUrl});
}

class StoryScreen extends StatelessWidget {
  StoryScreen({Key? key});

  List<User> sampleUsers = [
    User(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNTndpMXY2SQWuBK08LPBKts44hrgyyH82paSWcAD4zw&s',
      userName: 'User 1',
      stories: [
        Story(
          imageUrl:
              'https://images.unsplash.com/photo-1570598383310-fc553b759221?q=80&w=1846&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        Story(
          imageUrl:
              'https://images.unsplash.com/photo-1603686872523-f72035397760?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        Story(
          imageUrl:
              'https://images.unsplash.com/photo-1568930290058-7734cf3c16fe?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        Story(
          imageUrl:
              'https://images.unsplash.com/photo-1570974289394-57dd06b01c76?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
      ],
    ),
    // Add more users with their stories here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          final user = sampleUsers[pageIndex];
          final story = user.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: Image.network(
                  story.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae',
                          style: CustomTextStyle.mediumTextS,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44, left: 8),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      user.userName,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: IconButton(
                padding: EdgeInsets.zero,
                color: Colors.white,
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
        pageLength: sampleUsers.length,
        storyLength: (int pageIndex) {
          return sampleUsers[pageIndex].stories.length;
        },
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
