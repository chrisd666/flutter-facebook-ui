import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';
import 'package:flutter_facebook_ui/models/post_model.dart';
import 'package:flutter_facebook_ui/widgets/profile_avatar.dart';
import 'package:flutter_facebook_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(
                  height: 4,
                ),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6,
                      )
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl ?? ''),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _PostStats(post: post),
          )
        ]),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              Row(
                children: [
                  Text('${post.timeAgo} ??? ',
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                  Icon(
                    Icons.public,
                    color: Colors.grey.shade600,
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () => print('Print More'), icon: Icon(Icons.more_horiz))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                label: 'Like',
                onTap: () => print('Like')),
            _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                label: 'Comment',
                onTap: () => print('Comment')),
            _PostButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey.shade600,
                  size: 25,
                ),
                label: 'Share',
                onTap: () => print('Share')),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4,
                ),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
