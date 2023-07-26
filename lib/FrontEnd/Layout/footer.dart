import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Services/Utils/responsive.dart';
import '../../Services/constants.dart';
import 'Components/social_media_button.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Responsive.isMobile(context)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo_no_text.png',
                      height: 50.0,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'OptimaDecision Consulting',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text('Email: contact@example.com'),
                    Text('Phone: +1 123 456 7890'),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Support',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text('FAQ'),
                    Text('Terms and Conditions'),
                    Text('Privacy Policy'),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Follow Us',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        SocialMediaButton(
                          index: 1,
                          url: AppConstants.eMail,
                          iconData: Icons.alternate_email_rounded,
                        ),
                        SocialMediaButton(
                          index: 2,
                          url: AppConstants.linkedInProfileURL,
                          iconData: FontAwesomeIcons.linkedin,
                        ),
                        SocialMediaButton(
                          index: 3,
                          url: AppConstants.twitterURL,
                          iconData: FontAwesomeIcons.twitter,
                        ),
                        SocialMediaButton(
                          index: 4,
                          url: AppConstants.facebookProfileURL,
                          iconData: FontAwesomeIcons.facebook,
                        ),
                        SocialMediaButton(
                          index: 5,
                          url: AppConstants.instagramProfileURL,
                          iconData: FontAwesomeIcons.instagram,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logo_no_text.png',
                      height: 50.0,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'OptimaDecision Consulting',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
