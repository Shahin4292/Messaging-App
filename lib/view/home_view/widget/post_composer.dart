import 'package:flutter/material.dart';

class PostComposer extends StatelessWidget {
  const PostComposer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.person,size: 25,color: Colors.grey.shade500,)
          ),
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