import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/ConnectProfile/ConnectProfile.dart';
import 'package:flutter_application_1/services/user_service.dart';
import 'package:flutter_application_1/types/user.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:flutter_svg/svg.dart';

class ChannelTile extends StatelessWidget {
  final Channel channel;
  final VoidCallback onTap;

  const ChannelTile({super.key, required this.channel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final UserService userServices = UserService();

    final currentUser = channel.state?.currentUserMember;
    final targetUser = channel.state?.members
        .firstWhere((member) => member.userId != currentUser?.userId)
        .user;
    final lastMessage = channel.state?.messages.reversed.firstWhere(
      (message) => !message.isDeleted,
    );
    final isMessageRead = channel.state!.currentUserRead!.lastRead
        .isAfter(lastMessage!.createdAt);
    final unreadCount = channel.state!.unreadCount;

    return Stack(
      children: [
        ListTile(
          onTap: onTap,
          leading: Container(
              margin: const EdgeInsets.only(right: 4.0),
              child: StreamChannelAvatar(
                channel: channel,
                onTap: () async {
                  final UserInDB targetUserDB =
                      await userServices.findById(uid: targetUser!.id);

                  // ignore: use_build_context_synchronously
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ConnectProfile(user: targetUserDB);
                  }));
                },
              )),
          title: Container(
              margin: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                targetUser?.name ?? '',
                style: const TextStyle(
                    color: Color.fromRGBO(22, 30, 46, 1), fontSize: 14.0),
              )),
          subtitle: ChannelListTileSubtitle(
            channel: channel,
            textStyle: const TextStyle(
                fontSize: 14.0, color: Color.fromRGBO(37, 60, 120, 1)),
          ),
          trailing: lastMessage == null
              ? const SizedBox()
              : Column(
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
                    ]),
        ),
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
