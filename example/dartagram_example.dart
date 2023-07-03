import 'package:dartagram/dartagram.dart';

Future<void> main() async {
  var user = await User.fromUsername('the_holy_crusader');

  print(user.id);
  print(user.fullName);
  print(user.username);
  print(user.profilePicUrl);
  print(user.pronouns);
  print(user.blockedByViewer);
  print(user.restrictedByViewer);
  print(user.countryBlock);
  print(user.followedBy);
  print(user.follow);
  print(user.isPrivate);
  print(user.isVerified);

  // Posts
  for (var post in user.posts) {
    print(post.id);
    print(post.type);
    print(post.owner.id);
    print(post.owner.username);
    print(post.likeCount);
    print(post.commentCount);
    print(post.displayUrl);
    print(post.thumbnailUrl);
    print(post.shortcode);
    print(post.dimensions.width);
    print(post.dimensions.height);

    // Media
    for (var media in post.medias) {
      print(media.id);
      print(media.owner.id);
      print(media.owner.username);
      print(media.url);
      print(media.videoUrl);
      print(media.isVideo);
      print(media.shortcode);
      print(media.dimensions.width);
      print(media.dimensions.height);
    }
  }

  // Biography
  print(user.biography.text);
  print(user.biography.rawText);
  print(user.biography.entities);
  // BioLink
  for (var link in user.biography.links) {
    print(link.title);
    print(link.url);
    print(link.lynxUrl);
    print(link.linkType);
  }
}
