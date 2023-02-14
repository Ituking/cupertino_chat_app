import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("chats").snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading"),
            );
          }

          if (snapshot.hasData) {
            return const CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: Text("Chats"),
                )
              ],
            );
          }
          return Container();
        });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return CustomScrollView(
  //     slivers: [
  //       const CupertinoSliverNavigationBar(
  //         largeTitle: Text("Chats"),
  //       ),
  //       SliverList(
  //         delegate: (SliverChildListDelegate(
  //           [
  //             const CupertinoListTile(
  //               title: Text("Chat1"),
  //             ),
  //             const CupertinoListTile(
  //               title: Text("Chat2"),
  //             ),
  //             const CupertinoListTile(
  //               title: Text("Chat3"),
  //             ),
  //           ],
  //         )),
  //       ),
  //     ],
  //   );
  // }
}
