class NewModel {
  final String title;
  final String image;
  final String description;
  final String article;
  final String author;
  final String infoAuthor;
  final List<String> tags;

  NewModel(this.title, this.image, this.description, this.article, this.author,
      this.infoAuthor, this.tags);

  String generateStringTags() {
    String stringTags = "";
    for (int i = 0; i < tags.length - 1; i++) {
      stringTags = "$stringTags${tags[i]}, ";
    }
    if (tags.isNotEmpty) {
      stringTags = "$stringTags${tags[tags.length - 1]}";
    }
    return stringTags;
  }
}
