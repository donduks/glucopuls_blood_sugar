import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glucopuls_2/converter/infrastructure/store_notifier.dart';

final numberProvider =
    StateNotifierProvider<MyConverter, String>((ref) => MyConverter());

 
    //final fastingListViewProvider = Provider((ref) => fastingDataPage());
