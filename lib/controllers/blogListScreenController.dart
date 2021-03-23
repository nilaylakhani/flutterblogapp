import 'package:blogappdemo/models/blog.dart';
import 'package:blogappdemo/services/remoteServices.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class BlogListScreenController extends GetxController {
  static List<Blog> blogList;
  static var isBlogsLoaded = false.obs;

  Future<void> fetchAllBlogs() async {
    isBlogsLoaded(false);
    try {
      blogList = await RemoteServices.getBlogs();
    } catch (error) {
      print(error);
    } finally {
      isBlogsLoaded(true);
    }
  }

  buildItemForList(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: ListTile(
        onTap: () => openSelectedBlog(index),
        leading: CachedNetworkImage(
          fit: BoxFit.fitWidth,
          height: 80,
          width: 80,
          // height: MediaQuery.of(context).size.height * 0.4,
          imageUrl: blogList[index].imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child:
                  RefreshProgressIndicator(value: downloadProgress.progress)),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Text(
          blogList[index].title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle:
            Text('Created On: ${getFormattedDate(blogList[index].createdAt)}'),
      ),
    );
  }

  openSelectedBlog(int index) {
    print('$index blog clicked.');
  }

  String getFormattedDate(DateTime time) {
    DateFormat dateFormat = DateFormat("MM/dd/yyyy HH:mm");
    return dateFormat.format(time);
  }
}
