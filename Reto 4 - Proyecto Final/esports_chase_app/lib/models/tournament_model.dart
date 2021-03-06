class TournamentModel {
  final String id;
  final String type;
  final String name;
  final String image;
  final String icon;
  final String region;
  final String esport;
  final String description;
  final String status;
  final List<String> teams;
  final List<String> teams_icons;

  TournamentModel(
    this.id,
    this.type,
    this.name,
    this.image,
    this.icon,
    this.region,
    this.esport,
    this.description,
    this.status,
    this.teams,
    this.teams_icons,
  );
}
