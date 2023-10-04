import 'package:awesome_notifications/awesome_notifications.dart';

void trigger() {
  AwesomeNotifications().createNotification(
      content: NotificationContent(id: 10, channelKey: 'appchannel',title: "Success",body: "Order placed successfully Thanks for Purchasing"));
}
