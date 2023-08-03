import 'package:flutter/material.dart';

import '../../../Services/Utils/responsive.dart';
import '../../Components/Forms/contact_form.dart';
import '../../Components/section_title.dart';
import 'Components/social_card.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
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
