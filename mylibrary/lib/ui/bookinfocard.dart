import 'package:flutter/material.dart';
import 'package:mylibrary/ui/uicolors.dart';

class BookInfoCard extends StatelessWidget {
  final String title;
  final List<String> authorNames;
  final String summary;
  const BookInfoCard(
      {Key? key,
      required this.title,
      required this.authorNames,
      required this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var author = "";
    for (var i = 0; i < authorNames.length; i++) {
      author += authorNames[i];
      if (i != authorNames.length - 1) {
        author += ", ";
      }
    }
    return AspectRatio(
      aspectRatio: 9 / 15,
      child: Container(
        margin: const EdgeInsets.only(top: 130),
        padding: const EdgeInsets.only(
          top: 100,
          bottom: 10,
          right: 10,
          left: 10,
        ),
        constraints: const BoxConstraints(
          maxWidth: 500,
          maxHeight: 700,
        ),
        decoration: cardDecorations,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                  maxLines: 2,
                  textScaleFactor: 1.7,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Text(
                  author,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.5,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child: Text(
                  summary,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(overflow: TextOverflow.ellipsis),
                  maxLines: 8,
                  textScaleFactor: 1.4,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
