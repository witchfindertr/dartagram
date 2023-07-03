import 'dimensions.dart';
import 'owner.dart';

class Media {
  late String id;
  late Owner owner;
  late String url;
  late String videoUrl = '';
  late bool isVideo = false;
  late String shortcode;
  late Dimensions dimensions;
  late Map<String, dynamic> raw;

  Media.fromData(Map<String, dynamic> data) {
    id = data['id'];
    owner = Owner.fromData(data['owner']);
    url = data['display_url'];
    if (data['is_video']) {
      isVideo = true;
      videoUrl = data['video_url'];
    }
    shortcode = data['shortcode'];
    dimensions = Dimensions.fromData(data['dimensions']);

    raw = data;
  }
}
