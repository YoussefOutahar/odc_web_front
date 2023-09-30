import 'package:flutter/material.dart';

import '../../../../../../DataBase/Controllers/message_controller.dart';
import '../../../../../../DataBase/Models/message.dart';
import '../../../../../../Services/constants.dart';

class MessagesSection extends StatefulWidget {
  const MessagesSection({super.key});

  @override
  State<MessagesSection> createState() => _MessagesSectionState();
}

class _MessagesSectionState extends State<MessagesSection> {
  late Stream<List<Message>> messagesStream;

  @override
  void initState() {
    messagesStream = MessageController.getMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1110, maxHeight: 500),
      child: StreamBuilder(
        stream: messagesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(kDefaultPadding / 4),
                  child: Card(
                    child: ListTile(
                        leading: snapshot.data![index].isRead
                            ? const Icon(Icons.mark_email_read, color: Colors.green)
                            : const Icon(Icons.mark_email_unread, color: Colors.red),
                        title: Text(snapshot.data![index].email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: const Icon(Icons.info),
                              onPressed: () {
                                showMessageDialogue(snapshot.data![index]);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                String uid = snapshot.data![index].uid as String;
                                MessageController.deleteMessage(uid);
                              },
                            ),
                          ],
                        )),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  showMessageDialogue(Message msg) {
    msg.isRead = true;
    MessageController.updateMessage(msg);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.message_rounded),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
        content: Container(
          constraints: const BoxConstraints(maxHeight: 300),
          child: Column(
            children: [
              Text(
                msg.email,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: kDefaultPadding),
              Text(msg.message)
            ],
          ),
        ),
      ),
    );
  }
}
