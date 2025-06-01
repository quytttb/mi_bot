import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../animations/typewriter_text.dart';

class MessageBubble extends StatefulWidget {
  final bool isUser;
  final String text;
  final bool animate;

  const MessageBubble({
    super.key,
    required this.isUser,
    required this.text,
    this.animate = false,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool isLiked = false;
  bool isDisliked = false;

  @override
  Widget build(BuildContext context) {
    final messageStyle = const TextStyle(
      color: Color(0xFF4A4A4A),
      fontSize: 15,
      height: 1.4,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      // Increase space between bubbles
      decoration: BoxDecoration(
        color: widget.isUser ? Colors.white : const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).toInt()),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Message content with avatar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Chỉnh sửa phần hiển thị của tin nhắn dựa vào người gửi
                if (!widget.isUser) ...[
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Theme.of(
                        context,
                      ).primaryColor.withAlpha((0.1 * 255).toInt()),
                      child: Image.asset('assets/images/icon.png', height: 24),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child:
                        widget.animate
                            ? TypewriterText(
                              text: widget.text,
                              animate: true,
                              style: messageStyle,
                              duration: Duration(
                                milliseconds: widget.text.length * 20,
                              ),
                            )
                            : Text(widget.text, style: messageStyle),
                  ),
                ] else ...[
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).primaryColor.withAlpha((0.1 * 255).toInt()),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(widget.text, style: messageStyle),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Action buttons for AI responses
          if (!widget.isUser) ...[
            Padding(
              padding: const EdgeInsets.only(left: 44, right: 16, top: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/like_icon.svg',
                      height: 16,
                      colorFilter: ColorFilter.mode(
                        isLiked
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade500,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                        if (isLiked) isDisliked = false;
                      });
                    },
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/unlike_icon.svg',
                      height: 16,
                      colorFilter: ColorFilter.mode(
                        isDisliked ? Colors.redAccent : Colors.grey.shade500,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isDisliked = !isDisliked;
                        if (isDisliked) isLiked = false;
                      });
                    },
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: widget.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Text copied to clipboard'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Theme.of(context).primaryColor,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/images/clipboard_icon.svg',
                      height: 14,
                      colorFilter: ColorFilter.mode(
                        Colors.grey.shade600,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: Text(
                      'Copy to clipboard',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      visualDensity: VisualDensity.compact,
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
