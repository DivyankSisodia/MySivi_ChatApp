import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../data/mock_data.dart';
import '../../../utils/custom_tabbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Your action when FAB is pressed (e.g., open new chat, add user, etc.)
          print("FAB pressed!");
        },
        backgroundColor: Colors.blue, // Or any color you want (e.g., Theme.of(context).primaryColor)
        foregroundColor: Colors.white,
        shape: const CircleBorder(), // Ensures perfect circle (default anyway)
        child: const Icon(
          Icons.add, // This is the plus icon
          size: 28,
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.backgroundColor,
              surfaceTintColor: AppColors.backgroundColor,
              centerTitle: true,
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 70,
              collapsedHeight: 70,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: const EdgeInsets.only(bottom: 8),
                title: Container(
                  height: 50,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(60)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedSegment = 0;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: _selectedSegment == 0 ? Colors.white : Colors.transparent),
                          child: Text(
                            'Users',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedSegment = 1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: _selectedSegment == 1 ? Colors.white : Colors.transparent),
                          child: Text(
                            'Chat History',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Divider(color: Colors.grey[300], thickness: 1),
              ),
            ),
            SliverPadding(padding: const EdgeInsets.all(24.0), sliver: _selectedSegment == 0 ? _buildUsersContent() : _buildChatHistoryContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildUsersContent() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final user = MockData.users[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 0),
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            // side: BorderSide(color: Colors.grey[100]!),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(user['color']),
                  child: Text(
                    user['initials'],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                if (user['isOnline'])
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            title: Text(user['name'], style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            subtitle: Text(
              user['status'],
              style: TextStyle(color: user['isOnline'] ? Colors.green : Colors.grey[500], fontWeight: user['isOnline'] ? FontWeight.w500 : FontWeight.normal),
            ),
          ),
        );
      }, childCount: MockData.users.length),
    );
  }

  Widget _buildChatHistoryContent() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final chat = MockData.chatHistory[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey[100]!),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: Color(chat['color']),
              child: Text(
                chat['initials'],
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(chat['name'], style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                Text(chat['time'], style: TextStyle(fontSize: 12, color: Colors.grey[500])),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      chat['lastMessage'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ),
                  if (chat['unreadCount'] > 0)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
                      child: Text(
                        chat['unreadCount'].toString(),
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }, childCount: MockData.chatHistory.length),
    );
  }
}
