// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/view/Widgets/confirm_button.dart';
import 'package:provider/provider.dart';

import 'package:medical/Core/utils/media_query_ex.dart';

import '../Core/constants/asset_manager.dart';
import '../Core/translations/locale_keys.g.dart';
import '../Core/utils/shimmer_widget.dart';
import '../viewModel/start_screen_provider.dart';

class FeedBackScreen extends StatefulWidget {
  final String feel;
  const FeedBackScreen({
    Key? key,
    required this.feel,
  }) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  void initState() {
    context.read<StartScreenProvider>().fitchDoctors();
    super.initState();
  }

  @override
  void dispose() {
    context.read<StartScreenProvider>().descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<StartScreenProvider>(
          builder: (context, myType, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AssetManager.doc,
                        width: context.width / 3,
                        height: context.height / 2,
                      ),
                      Expanded(
                          child: Form(
                        key: myType.fkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.feedBack.tr(),
                              style:
                                  Theme.of(context).primaryTextTheme.headline1,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            ConditionalBuilder(
                              condition: myType.isLoading,
                              builder: (context) => ShimmerWidget.rectangular(
                                width: context.width,
                                height: 50,
                                radius: 12,
                              ),
                              fallback: (context) => DropdownButtonFormField(
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return LocaleKeys.emptyDoctor.tr();
                                  }
                                  return null;
                                },
                                dropdownColor: Colors.white,
                                value: myType.selectedItem,
                                items: myType.doctorsList
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                onChanged: (value) =>
                                    myType.onDropdownchange(value!),
                                decoration: InputDecoration(
                                    label: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(LocaleKeys.chooseDepDoc.tr()),
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            TextFormField(
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6,
                                maxLines: 3,
                                controller: myType.descController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return LocaleKeys.emptyDesc.tr();
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    label: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(LocaleKeys.desc.tr()),
                                ))),
                            SizedBox(
                              height: 20.h,
                            ),
                            ConfirmButton(
                              onTap: () => myType.setPepoleFeedBack(
                                  widget.feel, context),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
