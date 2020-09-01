import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginal;

  const ContentList({
    Key key,
    this.title,
    this.contentList,
    this.isOriginal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: isOriginal ? 500.0 : 220.0,
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              itemCount: contentList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () => print(content.name),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: isOriginal ? 400.0 : 200.0,
                    width: isOriginal ? 200.0 : 130.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(content.imageUrl),
                      fit: BoxFit.cover,
                    )),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
