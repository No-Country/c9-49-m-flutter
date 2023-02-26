import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Chat/channel_tile.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';

// Pages
import './channel_page.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const ChannelListPage(),
    );
  }
}

class ChannelListPage extends StatefulWidget {
  const ChannelListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChannelListPage> createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  late final _listController = StreamChannelListController(
    client: StreamChat.of(context).client,
    filter: Filter.and([
      Filter.equal('type', 'messaging'),
      Filter.in_(
        'members',
        [StreamChat.of(context).currentUser!.id],
      ),
      Filter.equal('member_count', 2),
      Filter.exists('last_message_at'),
    ]),
    channelStateSort: const [SortOption('last_message_at')],
    limit: 20,
  );

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamChannelListView(
      controller: _listController,
      itemBuilder: _channelTileBuilder,
      emptyBuilder: _emptyBuilder,
      onChannelTap: (channel) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return StreamChannel(
                channel: channel,
                child: const ChannelPage(),
              );
            },
          ),
        );
      },
    );
  }

  Widget _emptyBuilder(BuildContext context) {
    return Center(
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: const Icon(
                Icons.chat,
                size: 80.0,
                color: Color.fromRGBO(0, 90, 194, 1),
              ),
            ),
            const Text(
              'Comienza a chatear',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ]),
    );
  }

  Widget _channelTileBuilder(BuildContext context, List<Channel> channels,
      int index, StreamChannelListTile defaultChannelTile) {
    final channel = channels[index];

    return ChannelTile(
      channel: channel,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StreamChannel(
              channel: channel,
              child: const ChannelPage(),
            ),
          ),
        );
      },
    );
  }
}
