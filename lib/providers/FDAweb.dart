import 'package:hooks_riverpod/hooks_riverpod.dart';

// class PageClick {
//   PageClick({required this.click});

//   final bool click;
// }

// final _pageClick = PageClick(click: false);

// final pageClickProvider = StateProvider<PageClick>((ref) {
//   return _pageClick;
// });

// final pageClickProvider = Provider<bool>((_) => false);

final pageClickProvider = StateProvider<bool>((ref) => false);

final question5Provider = StateProvider<bool>((ref) => false);

final date1Provider = StateProvider<DateTime>((ref) => DateTime.now());
final date2Provider = StateProvider<DateTime>((ref) => DateTime.now());
final date3Provider = StateProvider<DateTime>((ref) => DateTime.now());
final date4Provider = StateProvider<DateTime>((ref) => DateTime.now());
