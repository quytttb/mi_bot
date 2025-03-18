import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final VoidCallback onNewChat;

  const DrawerMenu({
    super.key,
    required this.onNewChat,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 40),
            // New chat button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text('New chat'),
                  minLeadingWidth: 10,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  onTap: () {
                    onNewChat();
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Last 7 days section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Last 7 days',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            // Recent chat items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildChatItem(
                    context,
                    icon: Icons.chat_bubble_outline,
                    title: 'English tutorial for...',
                  ),
                  _buildChatItem(
                    context,
                    icon: Icons.chat_bubble_outline,
                    title: 'LittleCommerce analyze...',
                  ),
                  _buildChatItem(
                    context,
                    icon: Icons.chat_bubble_outline,
                    title: 'English tutorial',
                  ),
                  // See all button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'See all',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  // Bottom menu items
                  _buildMenuItem(
                    context,
                    icon: Icons.help_outline,
                    title: 'FAQs',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.article_outlined,
                    title: 'Subscription',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.settings_outlined,
                    title: 'Setting',
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.logout_outlined,
                    title: 'Log Out',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem(
      BuildContext context, {
        required IconData icon,
        required String title,
      }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
        size: 22,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      minLeadingWidth: 10,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildMenuItem(
      BuildContext context, {
        required IconData icon,
        required String title,
      }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
        size: 22,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      minLeadingWidth: 10,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}