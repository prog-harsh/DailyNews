import 'package:daily_news/screens/web_screen.dart';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsTiles extends StatelessWidget {
  const NewsTiles(
    this.newsData,
    this.onRefresh,
    this.controller,
  );
  final controller;
  final newsData;
  final onRefresh;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      enablePullDown: true,
      header: ClassicHeader(),
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: newsData['articles'].length,
        itemBuilder: (ctx, i) {
          return Column(
            children: [
              Container(
                child: ListTile(
                  trailing: CachedNetworkImage(
                    imageUrl: newsData['articles'][i]['urlToImage'] == null
                        ? 'https://images.unsplash.com/photo-1529243856184-fd5465488984?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=769&q=80'
                        : newsData['articles'][i]['urlToImage'],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.25,
                    placeholderFadeInDuration: Duration(seconds: 2),
                    errorWidget: (bctx, s, _) => Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    placeholder: (bctx, _) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(newsData['articles'][i]['title']),
                  ),
                  subtitle: newsData['articles'][i]['description'] == null
                      ? Text('')
                      : Text(
                          newsData['articles'][i]['description'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          WebScreen(newsData['articles'][i]['url']),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                height: 20,
                color: Colors.white30,
              )
            ],
          );
        },
      ),
    );
  }
}
