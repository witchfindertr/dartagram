class Biography {
  late String text;
  late String rawText;
  late List<dynamic> entities;
  late List<BioLink> links;
  late Map<String, dynamic> raw;

  Biography(this.text, this.rawText, this.entities, this.links, this.raw);

  static Biography fromData(Map<String, dynamic> data) {
    final text = data['biography'];
    final rawText = data['biography_with_entities']['raw_text'];
    final entities = data['biography_with_entities']['entities'];

    late List<BioLink> links = [];
    for (var link in data['bio_links']) {
      links.add(BioLink.fromData(link));
    }

    return Biography(text, rawText, entities, links, data);
  }
}

class BioLink {
  late String title;
  late String url;
  late String lynxUrl;
  late String linkType;

  BioLink(this.title, this.url, this.lynxUrl, this.linkType);

  static BioLink fromData(Map<String, dynamic> data) {
    final title = data['title'];
    final url = data['url'];
    final lynxUrl = data['lynx_url'];
    final linkType = data['link_type'];

    return BioLink(title, url, lynxUrl, linkType);
  }
}
