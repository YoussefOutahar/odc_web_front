import 'package:flutter/material.dart';

import '../../../../Services/constants.dart';
import '../../../Components/Buttons/deafult_button.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            child: TextFormField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: "Your Name",
              ),
            ),
          ),
          SizedBox(
            child: TextFormField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: "Email Address",
              ),
            ),
          ),
          SizedBox(
            child: TextFormField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: "Message",
              ),
            ),
          ),
          Center(
            child: FittedBox(
              child: DefaultButton(
                text: "Contact Us!",
                press: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
