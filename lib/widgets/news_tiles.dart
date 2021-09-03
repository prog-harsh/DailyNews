import 'package:daily_news/web_screen.dart';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsTiles extends StatelessWidget {
  const NewsTiles(this.newsData);

  final newsData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                title: Text(newsData['articles'][i]['title']),
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
    );
  }
}
