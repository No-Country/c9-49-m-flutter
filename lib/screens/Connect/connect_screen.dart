import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// Page:
import '../Chat/channel_page.dart';

// Theme:
import '../../theme/colors_theme.dart';

// Types:
import '../../types/user.dart';

// Data:
import '../../data/languages.dart';

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
    late final StreamUserListController userListController =
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

    return Scaffold(
        appBar: AppBar(
            leading: const SizedBox(),
            title: const Text(
              "Buscar compañeros",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 90, 194, 1)),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0),
        body: Container(
          color: Colors.white,
          child: RefreshIndicator(
            onRefresh: () => userListController.refresh(),
            child: StreamUserListView(
              controller: userListController,
              itemBuilder: (context, users, index, defaultWidget) {
                final User user = users[index];
                final name = user.name;

                final nativeLang = user.extraData['nativeLanguage'].toString();
                final nativeLangText = languages
                    .firstWhere((lang) => lang["code"] == nativeLang)['name']
                    .toString();

                final targetLang = user.extraData['targetLanguage'].toString();
                final targetLangText = languages
                    .firstWhere((lang) => lang["code"] == targetLang)['name']
                    .toString();

                final isOnline = user.online;

                return ListTile(
                  onTap: () async {
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
                  leading: StreamUserAvatar(
                    user: user,
                    borderRadius: BorderRadius.circular(45),
                    constraints: BoxConstraints.tight(const Size(40.0, 40.0)),
                    showOnlineStatus: false,
                  ),
                  title: Row(
                    children: [
                      Container(
                        width: 6.0,
                        height: 6.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isOnline
                              ? LightModeColors.secondaryColor
                              : LightModeColors.grayColor,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        name,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Row(children: [
                        Text(nativeLangText,
                            style: const TextStyle(
                                fontSize: 13.0,
                                color: LightModeColors.grayColor)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: LightModeColors.secondaryColor,
                          size: 10.0,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(targetLangText,
                            style: const TextStyle(
                                fontSize: 13.0,
                                color: LightModeColors.blackColor))
                      ])
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
