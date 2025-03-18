import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageBubble extends StatefulWidget {
  final bool isUser;
  final String text;

  const MessageBubble({
    super.key,
    required this.isUser,
    required this.text,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.isUser ? Colors.grey[020] : Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Avatar and Message
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!widget.isUser)
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/images/icon.png'),
                  )
                else
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    child: const Icon(Icons.account_circle, size: 50),
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Row 2: Action buttons (like, dislike, copy)
          if (!widget.isUser) ...[
            Padding(
              padding: const EdgeInsets.only(left: 62, right: 16, bottom: 16),
              child: Row(
                children: [
                  // Like button
                  IconButton(
                    icon: SvgPicture.asset('assets/images/like_icon.svg'),
                    color: isLiked ? Colors.blue : Colors.grey[500],
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 16),
                  // Dislike button
                  IconButton(
                    icon: SvgPicture.asset('assets/images/unlike_icon.svg'),
                    onPressed: () {
                      // TODO: Handle dislike action
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const Spacer(),
                  // Copy button
                  TextButton.icon(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: widget.text));
                    },
                    icon: SvgPicture.asset('assets/images/clipboard_icon.svg'),
                    label: const Text(
                      'Copy to clipboard',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}