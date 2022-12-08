import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  static const String allowLikesTitle = 'Allow Likes';
  static const String allowLikesDescription =
      'By allowing likes, Users will be able to press on the like button on your post.';
  static const String allowLikesStorageKey = 'allow_likes';
  static const String allowCommentsTitle = 'Allow Comments';
  static const String allowCommentsDescription =
      'By allowing comments, Users will be able to write a comment on your post.';
  static const String allowCommentsStorageKey = 'allow_comments';

  static const String comment = 'comment';
  static const String loading = 'Loading...';
  static const String person = 'person';
  static const String people = 'people';
  static const String likeThis = 'like this';
  static const String delete = 'Delete';
  static const String areYouSureThatYouWantToDeleteThis =
      'Are you sure that you want to delete this?';
  static const String logout = 'Log out';
  static const String areYouSureThatYouWantToLogout =
      'Are you sure that you want to log out of the App?';

  static const String cancel = 'Cancel';

  const Strings._();
}
