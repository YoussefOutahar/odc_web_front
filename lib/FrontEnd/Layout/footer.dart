import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Services/Utils/responsive.dart';
import '../../Services/constants.dart';
import '../../translations/locale_keys.g.dart';
import '../Components/optima_logo.dart';
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
                    const OptimaDecisionLogo(),
                    const SizedBox(height: 10.0),
                    Semantics(
                      label: 'OptimaDecision Consulting',
                      child: const Text(
                        'OptimaDecision Consulting',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Semantics(
                  label: "Contact Information",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.footer_contact.tr(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      const Text('Email: contact@example.com'),
                      const Text('Phone: +1 123 456 7890')
                    ],
                  ),
                ),
                Semantics(
                  label: "Follow Us",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.footer_follow.tr(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      const Row(
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
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const OptimaDecisionLogo(),
                    const SizedBox(height: 10.0),
                    Semantics(
                      label: 'OptimaDecision Consulting',
                      child: const Text(
                        'OptimaDecision Consulting',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
