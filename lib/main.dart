import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kayish/shared/network/local/cashe_helper.dart';
import 'package:kayish/shared/network/local/secure_helper.dart';

import 'package:kayish/shared/network/remote/dio_helper.dart';
import 'package:kayish/shared/notifications/local_notification.dart';
import 'package:kayish/utils/utils.dart';

import 'blocs/bloc observer/bloc_observer.dart';
import 'modules/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  fcmToken= await FirebaseMessaging.instance.getToken();
  await CasheHelper.init();
  // NotificationApi.init();
  Bloc.observer=MyBlocObserver();
  DioHelper.init('https://keyesh.com.shatarh.net/api/');
  await SecureHelper.getInstance();

  runApp( App());
}





