import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../DataBase/Controllers/message_controller.dart';
import '../../../../DataBase/Models/message.dart';
import '../../../../Services/constants.dart';
import '../../../Components/Buttons/deafult_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  // late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _messageController;

  @override
  void initState() {
    // _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          // SizedBox(
          //   child: TextFormField(
          //     onChanged: (value) {},
          //     controller: _nameController,
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(),
          //       labelText: "Your Name",
          //     ),
          //   ),
          // ),
          SizedBox(
            child: TextFormField(
              onChanged: (value) {},
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email Address",
              ),
            ),
          ),
          SizedBox(
            child: TextFormField(
              onChanged: (value) {},
              controller: _messageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Message",
              ),
            ),
          ),
          Center(
            child: FittedBox(
              child: DefaultButton(
                text: "Contact Us!",
                press: () async {
                  await MessageController.addMessage(
                    Message(
                      email: _emailController.text,
                      message: _messageController.text,
                      isRead: false,
                    ),
                  );
                  Get.snackbar(
                    "Message Sent",
                    "We will get back to you as soon as possible",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
