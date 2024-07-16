import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_large.dart';
import 'package:habbito/core/common/utils/app_utils.dart';
import 'package:habbito/features/about/data/models/sub_section_item.dart';
import 'package:habbito/features/about/presentation/widgets/section_card.dart';
import 'package:habbito/themes/theme.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightCardBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const AppTextViewLarge(
          message: 'About Habbito',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(elements_small_padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: app_large_padding,
              ),
              SectionCard(
                sectiontitle: 'Share',
                subsections: [
                  SubSectionItem(
                      onClick: () {
                        openInBrowser(
                            urltoOpen:
                                'https://play.google.com/store/apps/details?id=dev.bensalcie.portfolio');
                      },
                      subsectiontitle: 'Share Habbito',
                      subsectionlocalimage: CupertinoIcons.share)
                ],
              ),
              SectionCard(
                sectiontitle: 'About',
                subsections: [
                  SubSectionItem(
                      onClick: () {
                        openInBrowser(
                            urltoOpen: 'https://www.instagram.com/ben.salcie');
                      },
                      subsectiontitle: 'Follow on Instagram',
                      subsectionlocalimage: CupertinoIcons.chat_bubble),
                  SubSectionItem(
                      onClick: () {
                        openInBrowser(
                            urltoOpen: 'https://twitter.com/ibensalcie');
                      },
                      subsectiontitle: 'Follow on X',
                      subsectionlocalimage: CupertinoIcons.xmark),
                  SubSectionItem(
                      onClick: () {
                        openInBrowser(
                            urltoOpen: 'http://www.linkedin.com/in/bensalcie');
                      },
                      subsectiontitle: 'Follow on LinkedIn',
                      subsectionlocalimage: CupertinoIcons.link_circle),
                  SubSectionItem(
                      onClick: () {
                        openInBrowser(
                            urltoOpen:
                                'https://play.google.com/store/apps/details?id=dev.bensalcie.portfolio');
                      },
                      subsectiontitle: 'Download personal Portfolio',
                      subsectionlocalimage: CupertinoIcons.doc_append)
                ],
              ),
              SectionCard(
                sectiontitle: 'App Info',
                subsections: [
                  SubSectionItem(
                      onClick: () async {
                        PackageInfo packageInfo =
                            await PackageInfo.fromPlatform();

                        // ignore: use_build_context_synchronously
                        showSnackBar(
                            context: context,
                            message:
                                'Current APP Version is ${packageInfo.version}',
                            type: SnackBarType.success);
                      },
                      subsectiontitle: 'App Version',
                      subsectionlocalimage: CupertinoIcons.info),
                  SubSectionItem(
                      onClick: () {
                        openInBrowser(
                            urltoOpen:
                                'http://bensalcie.likesyou.org/cwc/privacy_policy.html');
                      },
                      subsectiontitle: 'Terms and Conditions',
                      subsectionlocalimage: CupertinoIcons.t_bubble),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
