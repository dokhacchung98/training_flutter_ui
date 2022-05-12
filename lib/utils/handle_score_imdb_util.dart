class HandleScoreImdbUtil {
  static List handleScore(double score) {
    int firstScore = score.round();
    num secondScore = ((score - firstScore) * 10).round();
    return [firstScore, secondScore];
  }
}
