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
