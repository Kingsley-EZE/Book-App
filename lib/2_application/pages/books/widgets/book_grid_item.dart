import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class BookGridItem extends StatelessWidget {

  final String imageUrl;
  final String bookTitle;
  final String bookAuthor;
  final void Function()? onPress;

  const BookGridItem({
    super.key,
    required this.imageUrl,
    required this.bookTitle,
    required this.bookAuthor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 100,
                //width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: const Color(0xFFBDBDBD)),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              bookTitle,
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: themeData.textTheme.bodyText1,
            ),
            Text(
              bookAuthor,
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: themeData.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
