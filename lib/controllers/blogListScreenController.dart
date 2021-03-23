import 'package:blogappdemo/models/blog.dart';
import 'package:blogappdemo/services/remoteServices.dart';
import 'package:blogappdemo/utilities/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class BlogListScreenController extends GetxController {
  static List<Blog> blogList;
  static int selectedBlogIndex = 0;
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
        onTap: () => openSelectedBlog(context, index),
        leading: Hero(
          tag: 'imageTag$index',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              fit: BoxFit.fitWidth,
              height: 80,
              width: 80,
              imageUrl: blogList[index].imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: RefreshProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        title: Text(
          blogList[index].title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kPrimaryTextColor),
        ),
        subtitle: Text(
          'Created On: ${getFormattedDate(blogList[index].createdAt)}',
          style: TextStyle(fontSize: 12, color: kSecondTextColor),
        ),
      ),
    );
  }

  openSelectedBlog(BuildContext context, int index) {
    selectedBlogIndex = index;
    Navigator.of(context).pushNamed('/blogDetail');
  }

  static String getFormattedDate(DateTime time) {
    DateFormat dateFormat = DateFormat("MM/dd/yyyy HH:mm");
    return dateFormat.format(time);
  }
}
