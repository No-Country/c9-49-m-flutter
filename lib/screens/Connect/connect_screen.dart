import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../Chat/channel_page.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const UserListPage(),
    );
  }
}

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late final StreamUserListController _userListController =
      StreamUserListController(
    client: StreamChat.of(context).client,
    limit: 25,
    filter: Filter.and(
      [
        Filter.notEqual('id', StreamChat.of(context).currentUser!.id),
        Filter.equal('role', 'user'),
        // Filter.notEqual('dashboard_user', true)
      ],
    ),
    sort: [
      const SortOption(
        'name',
        direction: 1,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _userListController.refresh(),
      child: StreamUserListView(
        onUserTap: (user) async {
          final client = StreamChat.of(context).client;

          final channel = client.channel(
            'messaging',
            extraData: {
              'name': '${user.id} | ${client.state.currentUser!.id}',
              'members': [user.id, client.state.currentUser!.id],
            },
          );

          await channel.watch();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => StreamChannel(
                channel: channel,
                child: const ChannelPage(),
              ),
            ),
          );
        },
        controller: _userListController,
      ),
    );
  }
}
