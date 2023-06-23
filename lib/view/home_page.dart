import 'package:flutter/material.dart';

import 'package:user1/core/socses.dart';
import 'package:user1/model/port_model.dart';
import 'package:user1/service/post_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: FutureBuilder(
          future: PostService.getPost(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              List<PostModel> data =
                  (snapshot.data as SuccsesResponse).model as List<PostModel>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data[index].profileImage.toString()),
                          ),
                          title: Text(data[index].user.toString()),
                          subtitle: Text(data[index].job.toString()),
                        ),
                        Visibility(
                          visible: data[index].postImage!.isNotEmpty  ,
                          child: Image.network(data[index].profileImage.toString(),fit: BoxFit.cover,)),
                       const SizedBox(height: 10),
                        Text(data[index].post.toString()),
                      const  SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: const[
                              Text("666")
                            ],),
                            Row(children:const [
                              Text("22 comments")
                            ],)
                          ],
                        ),
                       const Divider(
                          thickness: 3,
                        ),
                        Row(
                          children: [
                            
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:const [
                                Icon(Icons.favorite),
                                Text("Like")
                              ],
                            ),
                             Column(
                              children:const [
                                Icon(Icons.comment),
                                Text("Comment")
                              ],
                            ),
                             Column(
                              children:const [
                                Icon(Icons.share),
                                Text("Share")
                              ],
                            ),
                             Column(
                              children:const [
                                Icon(Icons.send),
                                Text("Send")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: data.length,
              );
            }
          },
        ));
  }
}
