class HandleTimeUtil {
  static String handleYearRelease(String date) {
    if (date.length <= 4) return date;
    return date.substring(0, 4);
  }
}
