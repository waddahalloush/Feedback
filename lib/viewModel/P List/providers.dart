

import 'package:medical/viewModel/add_department_provider.dart';
import 'package:medical/viewModel/add_doctors_provider.dart';
import 'package:medical/viewModel/review_feedback_provider.dart';
import 'package:medical/viewModel/start_screen_provider.dart';
import 'package:medical/viewModel/view_department_provider.dart';
import 'package:medical/viewModel/view_doctors_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../app_provider.dart';

List<SingleChildWidget> providersList = [  ChangeNotifierProvider(
          create: (context) => AppProvider()..getAdminInfo(),
        ),
        ChangeNotifierProvider(
          create: (context) => StartScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddDepartmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ViewDoctorsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ViewDepartmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReviewFeedBackProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddDoctorsProvider(),
        ),
       ];
