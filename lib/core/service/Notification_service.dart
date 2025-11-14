import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService{
  final FirebaseMessaging firebaseMessaging =FirebaseMessaging.instance; // >>object from package


  void init(){
    firebaseMessaging.requestPermission(); // >> build in package >> to access in phone's user

    // this function handle Notifications when app is foreground(app is opening)
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      print("Message received: ${message.notification?.title}");



    });
    // this function handle Notifications when app is background(app is closing)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      print("Message received: ${message.notification?.title}");



    });

  } 


}
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class NotificationService {
//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance; // كائن من FirebaseMessaging
//
//   void init() {
//     // طلب إذن الوصول للإشعارات من المستخدم
//     firebaseMessaging.requestPermission();
//
//     // التعامل مع الإشعارات عندما يكون التطبيق في المقدمة (foreground)
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("Message received: ${message.notification?.title}");
//     });
//
//     // التعامل مع الإشعارات عندما يكون التطبيق في الخلفية (background)
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("Message received: ${message.notification?.title}");
//     });
//   }
// }
