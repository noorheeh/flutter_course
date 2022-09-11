import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:l4/data/users_data.dart';

class ChatScreen extends StatefulWidget {
  final int id;
  const ChatScreen(this.id, {super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              minLeadingWidth: 90,
              leading: SizedBox(
                width: 90,
                height: 100,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(usersData[widget.id]['img']),
                    ),
                  ],
                ),
              ),
              title: Text(
                usersData[widget.id]['name'],
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: const Text(
                'online',
                style: TextStyle(
                  color: Colors.white60,
                ),
              ),
              trailing: SizedBox(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: usersData[widget.id]['messages'].length,
                        shrinkWrap: true,
                        reverse: true,
                        itemBuilder: (context, index) {
                          List msgs = usersData[widget.id]['messages'];
                          msgs = msgs.reversed.toList();
                          if (msgs[index]['senderIsMe'] == true) {
                            return SendedMessage(
                              msg: msgs[index]['content'],
                              time: msgs[index]['date'],
                            );
                          }
                          return RecievedMessage(
                              msg: msgs[index]['content'],
                              time: msgs[index]['date']);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Type a Message ...',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mic,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      String time = DateFormat('h:mm a').format(DateTime.now());
                      String text = _controller.text.trim();

                      setState(() {
                        (usersData[widget.id]['messages'] as List).add({
                          'content': text,
                          'date': time,
                          'senderIsMe': true,
                        });
                        usersData[widget.id]['lastMessage'] = text;
                        usersData[widget.id]['lastMessageTime'] = time;
                      });
                      _controller.clear();
                      _timer = Timer(const Duration(seconds: 2), () {
                        time = DateFormat('h:mm a').format(DateTime.now());
                        setState(() {
                          (usersData[widget.id]['messages'] as List).add({
                            'content': text,
                            'date': time,
                            'senderIsMe': false,
                          });
                          usersData[widget.id]['lastMessage'] = text;
                          usersData[widget.id]['lastMessageTime'] = time;
                        });
                      });
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SendedMessage extends StatelessWidget {
  final String msg;
  final String time;

  const SendedMessage({
    super.key,
    required this.msg,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15, top: 5),
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            constraints: BoxConstraints(
              minHeight: 35,
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(35.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: Text(
                msg,
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}

class RecievedMessage extends StatelessWidget {
  final String msg;
  final String time;

  const RecievedMessage({
    super.key,
    required this.msg,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 5),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            constraints: BoxConstraints(
              minHeight: 35,
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(35.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: Text(
                msg,
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
