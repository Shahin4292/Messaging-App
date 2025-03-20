import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Facebook",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.chat, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(  // Ensures the entire body scrolls vertically.
        child: Column(
          children: [
            StorySection(),
            PostComposer(),
            PostFeed(),
          ],
        ),
      ),
    );
  }
}

class StorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.person, size: 40, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}

class PostComposer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          CircleAvatar(radius: 20, backgroundColor: Colors.grey.shade300),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text("What's on your mind?"),
            ),
          ),
        ],
      ),
    );
  }
}

class PostFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Prevents ListView from taking up all available space
      physics: NeverScrollableScrollPhysics(), // Makes the ListView scrollable within the scrollable body
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(backgroundColor: Colors.grey.shade300),
                title: Text("User Name"),
                subtitle: Text("5 hrs ago"),
                trailing: Icon(Icons.more_horiz),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("This is a sample post description."),
              ),
              Container(
                height: 200,
                color: Colors.grey.shade300,
                child: Center(child: Icon(Icons.image, size: 50, color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(icon: Icon(Icons.thumb_up_alt_outlined), onPressed: () {}),
                    IconButton(icon: Icon(Icons.comment_outlined), onPressed: () {}),
                    IconButton(icon: Icon(Icons.share_outlined), onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
