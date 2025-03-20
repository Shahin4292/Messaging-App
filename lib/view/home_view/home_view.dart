import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Message",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => CustomBottomNavScreen()),
                // );
              },
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/message.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // StorySection(),
          // PostComposer(),
          // Expanded(child: PostFeed()),
        ],
      ),
    );
  }
}


// class StorySection extends StatelessWidget {
//   const StorySection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 120,
//       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 6,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5),
//             child: CircleAvatar(
//               radius: 40,
//               backgroundColor: Colors.grey.shade300,
//               child: Icon(Icons.person, size: 40, color: Colors.grey),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class PostComposer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       child: Row(
//         children: [
//           CircleAvatar(radius: 20, backgroundColor: Colors.grey.shade300),
//           SizedBox(width: 10),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.grey.shade300),
//               ),
//               child: Text("What's on your mind?"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class PostFeed extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return Card(
//           margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ListTile(
//                 leading: CircleAvatar(backgroundColor: Colors.grey.shade300),
//                 title: Text("User Name"),
//                 subtitle: Text("5 hrs ago"),
//                 trailing: Icon(Icons.more_horiz),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Text("This is a sample post description."),
//               ),
//               Container(
//                 height: 200,
//                 color: Colors.grey.shade300,
//                 child: Center(child: Icon(Icons.image, size: 50, color: Colors.grey)),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     IconButton(icon: Icon(Icons.thumb_up_alt_outlined), onPressed: () {}),
//                     IconButton(icon: Icon(Icons.comment_outlined), onPressed: () {}),
//                     IconButton(icon: Icon(Icons.share_outlined), onPressed: () {}),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
