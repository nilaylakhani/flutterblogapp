import 'package:blogappdemo/controllers/blogListScreenController.dart';
import 'package:blogappdemo/utilities/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkColor,
        title: Text('Blog App'),
      ),
      body: Container(
        color: kLightColor,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                BlogListScreenController
                    .blogList[BlogListScreenController.selectedBlogIndex].title,
                style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryTextColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Hero(
                tag: 'imageTag${BlogListScreenController.selectedBlogIndex}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.fitWidth,
                    imageUrl: BlogListScreenController
                        .blogList[BlogListScreenController.selectedBlogIndex]
                        .imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: RefreshProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Created On : ${BlogListScreenController.getFormattedDate(BlogListScreenController.blogList[BlogListScreenController.selectedBlogIndex].createdAt)}',
                style: TextStyle(
                    fontSize: 15,
                    color: kSecondTextColor,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
