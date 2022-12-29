import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/Core/utils/media_query_ex.dart';
import 'package:medical/view/Widgets/feeling_widget.dart';
import 'package:medical/viewModel/review_feedback_provider.dart';
import 'package:provider/provider.dart';

import '../Core/constants/asset_manager.dart';
import '../Core/translations/locale_keys.g.dart';
import '../Core/utils/shimmer_widget.dart';

class ReviewFeedBackScreen extends StatefulWidget {
  const ReviewFeedBackScreen({super.key});

  @override
  State<ReviewFeedBackScreen> createState() => _ReviewFeedBackScreenState();
}

class _ReviewFeedBackScreenState extends State<ReviewFeedBackScreen> {
  @override
  void initState() {
    context.read<ReviewFeedBackProvider>().fitchReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<ReviewFeedBackProvider>(
      builder: (context, myType, child) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(AssetManager.med),
                title: Text(LocaleKeys.reviewFbScr.tr(),
                    style: Theme.of(context).primaryTextTheme.headline1),
                centerTitle: false,
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: 300.h,
            ),
            SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ConditionalBuilder(
                      condition: myType.isLoading,
                      builder: (context) => ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) =>
                            ShimmerWidget.rectangular(
                                width: context.width, height: 150, radius: 15),
                      ),
                      fallback: (context) => ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: myType.reviewList.length,
                        itemBuilder: (context, index) => Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Image.asset(
                                feelImage(myType.reviewList[index]['f_feel']),
                                width: 30,
                                height: 30,
                              ),
                              title: Text(myType.reviewList[index]['f_note']),
                              subtitle: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(myType.reviewList[index]['f_doctor']),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(myType.reviewList[index]['f_department'])
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        myType.deleteFeedback(
                                            myType.reviewList[index]['f_id'],
                                            index);
                                      },
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red)),
                                  Text(myType.reviewList[index]['f_time']),
                                ],
                              ),
                            )),
                      ),
                    )))
          ],
        );
      },
    ));
  }
}
