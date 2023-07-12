import 'package:flutter/material.dart';

import '../../../Services/responsive.dart';
import '../../Components/deafult_button.dart';
import '../../Components/section_title.dart';
import 'Components/social_card.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // this height only for demo
      // height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: const Column(
        children: [
          SizedBox(height: 20 * 2.5),
          SectionTitle(
            title: "Contact Us",
            subTitle: "For Project inquiry and information",
            color: Color(0xFF07E24A),
          ),
          ContactBox(),
          SizedBox(height: 20 * 2.5),
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1110),
      margin: const EdgeInsets.only(top: 20 * 2),
      padding: const EdgeInsets.all(20 * 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Responsive.isMobile(context)
              ? Column(
                  children: [
                    SocialCard(
                      color: const Color(0xFFE8F0F9),
                      iconSrc: "assets/images/linkedin-50.png",
                      name: 'LinkedIn',
                      press: () {},
                    ),
                    SocialCard(
                      color: const Color(0xFFD9FFFC),
                      iconSrc: "assets/images/email-50.png",
                      name: 'Email',
                      press: () {},
                    ),
                    SocialCard(
                      color: const Color(0xFFE4FFC7),
                      iconSrc: "assets/images/phone-50.png",
                      name: 'Call Us',
                      press: () {},
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialCard(
                      color: const Color(0xFFE8F0F9),
                      iconSrc: "assets/images/linkedin-50.png",
                      name: 'LinkedIn',
                      press: () {},
                    ),
                    SocialCard(
                      color: const Color(0xFFD9FFFC),
                      iconSrc: "assets/images/email-50.png",
                      name: 'Email',
                      press: () {},
                    ),
                    SocialCard(
                      color: const Color(0xFFE4FFC7),
                      iconSrc: "assets/images/phone-50.png",
                      name: 'Call Us',
                      press: () {},
                    ),
                  ],
                ),
          const SizedBox(height: 20 * 2),
          const ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: 20 * 2.5,
        runSpacing: 20 * 1.5,
        children: [
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: "Your Name",
                hintText: "Enter Your Name",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: "Email Address",
                hintText: "Enter your email address",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: "Project Type",
                hintText: "Select Project Type",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: "Project Budget",
                hintText: "Select Project Budget",
              ),
            ),
          ),
          SizedBox(
            // height: 300,
            // TextField by default cover the height, i tryed to fix this problem but i cant
            child: TextFormField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: "Description",
                hintText: "Write some description",
              ),
            ),
          ),
          const SizedBox(height: 20 * 2),
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
