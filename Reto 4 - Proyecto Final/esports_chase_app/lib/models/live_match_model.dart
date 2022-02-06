class LiveMatchModel {
  final String id;
  final String tournament;
  final String esport;
  final String time;
  final String team_1;
  final String team_1_icon;
  final String team_2;
  final String team_2_icon;
  final List<String> stats_name;
  final List<String> stats_team_1;
  final List<String> stats_team_2;

  LiveMatchModel(
      this.id,
      this.tournament,
      this.esport,
      this.time,
      this.team_1,
      this.team_1_icon,
      this.team_2,
      this.team_2_icon,
      this.stats_name,
      this.stats_team_1,
      this.stats_team_2);
}
