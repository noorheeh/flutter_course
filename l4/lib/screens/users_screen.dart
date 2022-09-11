import 'package:flutter/material.dart';
import 'package:l4/data/users_data.dart';
import 'package:l4/screens/chat_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<String> menuItems = [
    'Friends',
    'Teachers',
    'Groups',
    'Add More',
  ];
  String activeMenu = 'Friends';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Message\'s (32)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
              child: ListView.builder(
                itemCount: menuItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MenuItem(
                    name: menuItems[index],
                    isActive: menuItems[index] == activeMenu,
                    onTap: () {
                      setState(() {
                        activeMenu = menuItems[index];
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Container(
                height: 80.0,
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemExtent: 80.0,
                    itemCount: usersData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ListTile(
                                onTap: () async {
                                  await Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          ChatScreen(index),
                                    ),
                                  );
                                  setState(() {
                                    usersData[index]['unReadMessagesCount'] = 0;
                                  });
                                },
                                leading: Container(
                                  width: 50,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Image.network(
                                    usersData[index]['img'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(usersData[index]['name']),
                                subtitle: Text(
                                  usersData[index]['lastMessage'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    usersData[index]['unReadMessagesCount'] != 0
                                        ? CircleAvatar(
                                            backgroundColor:
                                                Colors.purple.shade800,
                                            radius: 8,
                                            child: FittedBox(
                                                alignment: Alignment.center,
                                                fit: BoxFit.contain,
                                                child: Text(
                                                  usersData[index][
                                                          'unReadMessagesCount']
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                )),
                                          )
                                        : const SizedBox(
                                            height: 10,
                                            width: 5,
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      usersData[index]['lastMessageTime'],
                                      style: const TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              indent: 10,
                              endIndent: 10,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String name;
  final bool isActive;
  final Function onTap;

  const MenuItem({
    Key? key,
    required this.name,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 30,
        width: 80,
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              )
            : const BoxDecoration(),
        child: Text(
          name,
          style: TextStyle(
            color: isActive ? Colors.lightBlue : Colors.white60,
          ),
        ),
      ),
    );
  }
}
