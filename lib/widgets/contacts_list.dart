import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/models/user_model.dart';
import 'package:flutter_facebook_ui/widgets/user_card.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                'Contacts',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
              Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey.shade600,
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final User user = users[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: UserCard(
                    user: user,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
