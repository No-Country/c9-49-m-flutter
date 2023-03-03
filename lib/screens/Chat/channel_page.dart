import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/ConnectProfile/ConnectProfile.dart';
import 'package:flutter_application_1/services/user_service.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final channel = StreamChannel.of(context).channel;
    final UserService userService = UserService();

    final currentUser = channel.state?.currentUserMember;
    final targetUser = channel.state?.members
        .firstWhere((member) => member.userId != currentUser?.userId)
        .user;

    return Scaffold(
      appBar: StreamChannelHeader(
        onBackPressed: () async {
          final messages = channel.state!.channelState.messages;

          if (messages == null || messages.isEmpty) {
            await channel.delete();
          }

          Navigator.pop(context);
        },
        title: Text(
          targetUser!.name,
          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        onImageTap: () async {
          final targetUserInDb = await userService.findById(uid: targetUser.id);

          // ignore: use_build_context_synchronously
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ConnectProfile(user: targetUserInDb);
          }));
        },
      ),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }

  Widget _messageBuilder(
    BuildContext context,
    MessageDetails details,
    List<Message> messages,
    StreamMessageWidget defaultMessageWidget,
  ) {
    final message = details.message;
    final isCurrentUser =
        StreamChat.of(context).currentUser!.id == message.user!.id;
    final textAlign = isCurrentUser ? TextAlign.right : TextAlign.left;
    final color = isCurrentUser ? Colors.blueGrey : Colors.blue;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: ListTile(
          title: Text(
            message.text!,
            textAlign: textAlign,
          ),
          subtitle: Text(
            message.user!.name,
            textAlign: textAlign,
          ),
        ),
      ),
    );
  }
}
