import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

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
    filter: Filter.in_(
      'members',
      [StreamChat.of(context).currentUser!.id],
    ),
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
    final lastMessage = channel.state?.messages.reversed.firstWhere(
      (message) => !message.isDeleted,
    );
    // final lastMessageTime =
    //     DateFormat.Hm().format(lastMessage!.createdAt.toLocal());
    final isMessageRead = channel.state!.currentUserRead!.lastRead
        .isAfter(lastMessage!.createdAt);
    final unreadCount = channel.state!.unreadCount;

    // final subtitle = lastMessage == null ? 'nothing yet' : lastMessage.text!;
    // final opacity = (channel.state?.unreadCount ?? 0) > 0 ? 1.0 : 0.5;

    final theme = StreamChatTheme.of(context);

    return Stack(
      children: [
        ListTile(
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
            leading: Container(
                margin: const EdgeInsets.only(right: 4.0),
                child: StreamChannelAvatar(
                  channel: channel,
                )),
            title: Container(
                margin: const EdgeInsets.only(bottom: 4.0),
                child: StreamChannelName(
                  channel: channel,
                  textStyle: theme.channelPreviewTheme.titleStyle!.copyWith(
                      // color: theme.colorTheme.textHighEmphasis.withOpacity(opacity),
                      color: const Color.fromRGBO(22, 30, 46, 1),
                      fontSize: 14.0),
                )),
            subtitle: ChannelListTileSubtitle(
              channel: channel,
              textStyle: const TextStyle(
                  fontSize: 14.0, color: Color.fromRGBO(37, 60, 120, 1)),
            ),
            trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 4.0),
                    child: ChannelLastMessageDate(
                      channel: channel,
                      textStyle: const TextStyle(
                          fontSize: 10.0,
                          color: Color.fromRGBO(107, 114, 128, 1)),
                    ),
                  ),
                  isMessageRead
                      ? SvgPicture.asset(
                          "assets/chat/check_read.svg",
                          width: 20.0,
                          height: 18.0,
                        )
                      : SvgPicture.asset(
                          "assets/chat/check_unread.svg",
                          width: 20.0,
                          height: 18.0,
                        )
                ])),
        if (unreadCount > 0)
          Positioned(
            top: 6,
            left: 42,
            child: Container(
              width: 22.0,
              height: 22.0,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(104, 200, 0, 1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3.0, color: Colors.white)),
              child: Center(
                  child: Text(
                '$unreadCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )),
            ),
          ),
      ],
    );
  }
}
