import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../misc/colors.dart';
import '../misc/widget_method.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
   return const Scaffold(

     body: SafeArea(
       child: SingleChildScrollView(
         child: Padding(
           padding: EdgeInsets.only(left: 30, right: 30),
           child: Column(
             children: [
               Text("AGREEMENT",
                   style: TextStyle(
                     fontFamily: 'Fraiche',
                     fontSize: 16,
                     fontWeight: FontWeight.w300,
                     color: DeckColors.white,
                   )
               ),
               ///
               /// T E R M S  O  F  U S E
               ///
               Text("Terms of Use",
               style: TextStyle(
                 fontFamily: 'Fraiche',
                 fontSize: 24,
                 fontWeight: FontWeight.w600,
                 color: DeckColors.white,
               )
                 ),
               SizedBox( height: 10),
               Text("Welcome to Deck!",
                   style: TextStyle(
                     fontFamily: 'nunito',
                     fontSize: 20,
                     fontWeight: FontWeight.w600,
                     color: DeckColors.white,
                   ),
                 ),
               SizedBox(height: 10),
               Text('These Terms of Use (Terms) govern your access to '
                       'and use of the Deck application ("Deck" or the "App"), '
                       'including any content, functionality, and services offered '
                       'on or through the App. By accessing or using Deck, you '
                       'agree to be bound by these Terms. If you do not agree to '
                       'these Terms, please do not access or use our Deck.',
                     style: TextStyle(
                       fontFamily: 'nunito',
                       fontSize: 16,
                       fontWeight: FontWeight.normal,
                       color: DeckColors.white,
                     ),
                   ),
               SizedBox(
                     height: 10,
                   ),
               Text.rich(
                 TextSpan(
                   style: TextStyle(
                     fontFamily: 'nunito',
                     fontSize: 16,
                     fontWeight: FontWeight.normal,
                     color: Colors.black,
                   ),
                   children: [
                     TextSpan(
                       text: '1. Your Use of Deck\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'a. Eligibility: ',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'You must be at least 13 years old to use Deck. '
                           'By using Deck, you represent and warrant that you are at least 13 years old.\n',
                     ),
                     TextSpan(
                       text: 'b. Accounts: ',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'In order to access certain features of Deck, you may be required to '
                           'create an account. You agree to provide accurate, current, and complete '
                           'information during the registration process and to update such information'
                           ' to keep it accurate, current, and complete.\n',
                     ),
                     TextSpan(
                       text: 'c. Use Restrictions: ',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'You agree to use Deck only for its intended purposes and in '
                           'accordance with these Terms. You may not use Deck for any illegal or '
                           'unauthorized purpose.\n\n',
                     ),
                     TextSpan(
                       text: '2. Privacy Policy\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'Your privacy is important to us. Our Privacy Policy explains how '
                           'we collect, use, disclose, and protect your personal information. '
                           'By accessing or using Deck, you consent to the collection, use, '
                           'disclosure, and protection of your personal '
                           'information as described in our Privacy Policy.\n\n',
                     ),
                     TextSpan(
                       text: '3. Intellectual Property\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'Deck and its entire contents, features, and functionality '
                           '(including but not limited to all information, software, text, '
                           'displays, images, video, and audio, and the design, selection, and '
                           'arrangement thereof) are owned by Deck or its licensors and are protected '
                           'by copyright, trademark, patent, trade secret, and other intellectual '
                           'property or proprietary rights laws.\n\n',
                     ),
                     TextSpan(
                       text: '4. Disclaimer\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'Deck is provided as is and as available without any warranties '
                           'of any kind, express or implied. We do not warrant that Deck will be '
                           'error-free or uninterrupted, that defects will be corrected, or that '
                           'Deck is free of viruses or other harmful components.\n\n',
                     ),
                     TextSpan(
                       text: '5. Limitation of Liability\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'In no event shall Deck, its affiliates, or their respective officers, '
                           'directors, employees, or agents be liable for any indirect, incidental, '
                           'special, consequential, or punitive damages, including without limitation '
                           'damages for loss of profits, data, use, goodwill, or other intangible losses, '
                           'arising out of or in connection with your access to or use of Deck.\n\n',
                     ),
                     TextSpan(
                       text: '6. Governing Law\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'These Terms are governed by and construed in accordance with the laws of '
                           'the Philippines, without regard to its conflict of law principles.\n\n',
                     ),
                     TextSpan(
                       text: '7. Changes to Terms\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'We reserve the right, at our sole discretion, to modify or replace'
                           ' these Terms at any time. If a revision is material, we will provide at least '
                           '30 days notice prior to any new terms taking effect. What constitutes a '
                           'material change will be determined at our sole discretion.',
                     ),
                   ],
                 ),
               ),
               SizedBox(height: 10),
               ///
               /// P R I V A C Y  P O L I C Y
               ///

               Text("Privacy Policy",
                   style: TextStyle(
                     fontFamily: 'Fraiche',
                     fontSize: 24,
                     fontWeight: FontWeight.w600,
                     color: DeckColors.white,
                   )
               ),
               SizedBox( height: 10),
               Text('At Deck, we are committed to protecting your privacy. This '
                   'Privacy Policy describes how your personal information is collected, '
                   'used, and shared when you use the Deck application (the "App").',
                 style: TextStyle(
                   fontFamily: 'nunito',
                   fontSize: 16,
                   fontWeight: FontWeight.normal,
                   color: DeckColors.white,
                 ),
               ),
               SizedBox(
                 height: 10,
               ),
               Text.rich(
                 TextSpan(
                   style: TextStyle(
                     fontFamily: 'nunito',
                     fontSize: 16,
                     fontWeight: FontWeight.normal,
                     color: Colors.black,
                   ),
                   children: [
                     TextSpan(
                       text: '1. Information We Collect\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'a. Information You Provide: ',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'When you register an account with Deck, we collect certain personal '
                           'information such as your name, email address, and password.\n',
                     ),
                     TextSpan(
                       text: 'b. Usage Information: ',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'We collect information about your interactions with the App, '
                           'including your study habits, flashcard usage, and preferences.\n',
                     ),
                     TextSpan(
                       text: 'c. Device Information: ',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'We collect information about the device you use to access the App, '
                           'including the hardware model, operating system version, and unique '
                           'device identifiers.\n\n',
                     ),
                     TextSpan(
                       text: '2. How We Use Your Information\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'We use the information we collect to provide and improve the App, '
                           'personalize your experience, communicate with you, and protect the '
                           'security of the App.\n\n',
                     ),
                     TextSpan(
                       text: '3. Sharing Your Information\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'We may share your personal information with third-party service '
                           'providers who assist us in providing the App, such as hosting providers '
                           'and analytics services. We may also share your information in response '
                           'to legal requests or to protect our rights or the rights of others.\n\n',
                     ),
                     TextSpan(
                       text: '4. Data Retention\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'We will retain your personal information for as long as necessary to '
                           'fulfill the purposes outlined in this Privacy Policy unless a longer '
                           'retention period is required or permitted by law.\n\n',
                     ),
                     TextSpan(
                       text: '5. Security\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'We take reasonable measures to protect the security of your '
                           'personal information and to prevent unauthorized access, disclosure, '
                           'alteration, or destruction.\n\n',
                     ),
                     TextSpan(
                       text: '6. Children\'s Privacy\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'Deck is not directed to children under the age of 13, and we do '
                           'not knowingly collect personal information from children under the '
                           'age of 13. If we become aware that we have collected personal '
                           'information from a child under the age of 13, we will take steps '
                           'to delete such information.\n\n',
                     ),
                     TextSpan(
                       text: '7. Changes to Privacy Policy\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'We reserve the right to modify this Privacy Policy at a'
                           'ny time. If we make material changes to this Privacy Policy, we '
                           'will notify you by email or by posting a notice in the App prior '
                           'to the changes taking effect.\n\n',
                     ),
                     TextSpan(
                       text: '8. Contact Us\n',
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                     TextSpan(
                       text: 'If you have any questions or concerns about this Privacy '
                           'Policy, please contact us at \'deckoctopus@gmail.com\'.',
                     ),
                   ],
                 ),
               ),
               SizedBox(height: 10),
               Text("By using the Deck App, you consent to the "
                   "collection and use of your personal information as described in this Privacy Policy. "
                   "Thank you for using Deck!",
                   style: TextStyle(
                     fontFamily: 'nunito',
                     fontSize: 16,
                     fontWeight: FontWeight.w600,
                     color: DeckColors.white,
                   )
               ),
             ],
           ),
         ),
       )
         
       ),
   );
  }
}