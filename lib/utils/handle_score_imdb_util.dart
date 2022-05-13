class HandleScoreImdbUtil {
  static List handleScore(double score) {
    int firstScore = score.floor();
    num secondScore = ((score - firstScore) * 10).floor();
    return [firstScore, secondScore];
  }
}
