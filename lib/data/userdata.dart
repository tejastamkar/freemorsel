import 'package:flutter_cache_manager/flutter_cache_manager.dart';

// String name = 'Zara', lastName = 'Adam';
int donationLevel = 0, level = 0, points = 0;
String profileImage =
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80";
// int phoneNo = 1234567890;
String email = "freemosal.com";
String username = "", phoneNum = "", fcmToken = "";

int profilePicSelector = 1;

final customCacheManager = CacheManager(Config('customCacheManager',
    stalePeriod: const Duration(minutes: 20), maxNrOfCacheObjects: 100));
