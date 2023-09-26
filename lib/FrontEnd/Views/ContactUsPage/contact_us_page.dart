import 'package:flutter/material.dart';

import '../../../Services/Utils/responsive.dart';
import '../../../Services/constants.dart';
import 'Components/contact_form.dart';
import '../../Components/section_title.dart';
import 'Components/faq.dart';
import 'Components/social_card.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding * 2.5),
          SectionTitle(
            title: "Contact Us",
            subTitle: "For Project inquiry and information",
            color: kAppColors[4],
          ),
          const ContactBox(),
          const SizedBox(height: kDefaultPadding * 2.5),
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
    Size size = MediaQuery.of(context).size;
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
                      color: kAppColors[0],
                      iconSrc: "assets/images/linkedin-50.png",
                      name: 'LinkedIn',
                      press: () {},
                    ),
                    SocialCard(
                      color: kAppColors[1],
                      iconSrc: "assets/images/email-50.png",
                      name: 'Email',
                      press: () {},
                    ),
                    SocialCard(
                      color: kAppColors[2],
                      iconSrc: "assets/images/phone-50.png",
                      name: 'Call Us',
                      press: () {},
                    ),
                  ],
                )
              : Wrap(
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    SocialCard(
                      color: kAppColors[0],
                      iconSrc: "assets/images/linkedin-50.png",
                      name: 'LinkedIn',
                      press: () {},
                    ),
                    SocialCard(
                      color: kAppColors[1],
                      iconSrc: "assets/images/email-50.png",
                      name: 'Email',
                      press: () {},
                    ),
                    SocialCard(
                      color: kAppColors[2],
                      iconSrc: "assets/images/phone-50.png",
                      name: 'Call Us',
                      press: () {},
                    ),
                  ],
                ),
          const SizedBox(height: kDefaultPadding * 3),
          Responsive.isMobile(context)
              ? const Column(
                  children: [
                    ContactForm(),
                    SizedBox(height: kDefaultPadding),
                    Divider(),
                    SizedBox(height: kDefaultPadding),
                    Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: FAQ(),
                    ),
                  ],
                )
              : Row(
                  children: [
                    const Expanded(child: ContactForm()),
                    const SizedBox(width: kDefaultPadding * 2),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: SizedBox(
                        width: size.width * 0.3,
                        child: const FAQ(),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
