import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../Chat/channel_page.dart';
import '../../types/user.dart';

class ConnectScreen extends StatelessWidget {
  final UserInDB user;

  const ConnectScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: UserListPage(
        user: user,
      ),
    );
  }
}

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key, required this.user}) : super(key: key);

  final UserInDB user;

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    late final StreamUserListController _userListController =
        StreamUserListController(
      client: StreamChat.of(context).client,
      limit: 25,
      filter: Filter.and(
        [
          Filter.notEqual('id', StreamChat.of(context).currentUser!.id),
          Filter.equal('role', 'user'),
          Filter.or([
            Filter.equal('targetLanguage', widget.user.targetLanguage),
            Filter.equal('nativeLanguage', widget.user.targetLanguage)
          ])
        ],
      ),
      sort: [
        const SortOption(
          'last_seen',
          direction: SortOption.ASC,
        ),
      ],
    );

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
