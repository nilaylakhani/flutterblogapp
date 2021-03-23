import 'package:blogappdemo/controllers/blogListScreenController.dart';
import 'package:blogappdemo/services/remoteServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BlogListScreen extends StatefulWidget {
  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  final BlogListScreenController blogListScreenController =
      BlogListScreenController();
  @override
  void initState() {
    super.initState();
    blogListScreenController.fetchAllBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (!BlogListScreenController.isBlogsLoaded.value)
          return Center(child: RefreshProgressIndicator());
        else if (BlogListScreenController.blogList.isEmpty)
          return Text('No Blogs Available.');
        else
          return ListView.builder(
              itemCount: BlogListScreenController.blogList.length,
              itemBuilder: (context, index) {
                return blogListScreenController.buildItemForList(
                    context, index);
              });
      }),
    );
  }
}
