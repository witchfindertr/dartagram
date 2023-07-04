import 'dimensions.dart';
import 'media.dart';
import 'owner.dart';

class Post {
  late String id;
  late String type;
  late Owner owner;
  late List<Media> medias;
  late List<dynamic> captions; // Can be List<String> or null
  late int likeCount;
  late int commentCount;
  late String displayUrl;
  late String thumbnailUrl;
  late String shortcode;
  late Dimensions dimensions;
  late Map<String, dynamic> raw;

  static Post fromData(Map<String, dynamic> data) {
    Post post = Post();

    post.id = data['id'];
    post.type = data['__typename'];
    post.owner = Owner.fromData(data['owner']);
    post.captions = data['edge_media_to_caption']['edges'];
    post.likeCount = data['edge_liked_by']['count'];
    post.commentCount = data['edge_media_to_comment']['count'];
    post.displayUrl = data['display_url'];
    post.thumbnailUrl = data['thumbnail_src'];
    post.shortcode = data['shortcode'];
    post.dimensions = Dimensions.fromData(data['dimensions']);

    post.raw = data;

    post.medias = [];
    if (post.type == "GraphSideCar") {
      for (var media in data['edge_sidecar_to_children']['edges']) {
        post.medias.add(Media.fromData(media['node']));
      }
    } else {
      post.medias.add(Media.fromData(data));
    }

    return post;
  }
}
