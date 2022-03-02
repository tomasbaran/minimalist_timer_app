class ParseService {
  String durationToTimerFormat(Duration duration) {
    int _minutes = duration.inMinutes;
    int _seconds = duration.inSeconds % 60;
    String _minutesFormat = _minutes.toString().padLeft(2, "0");
    String _secondsFormat = _seconds.toString().padLeft(2, "0");
    String output = _minutesFormat + ':' + _secondsFormat;
    return output;
  }

  int durationToSeconds(Duration duration) {
    int _minutes = duration.inMinutes;
    int _secondsLeft = duration.inSeconds % 60;
    int _allSeconds = _minutes * 60 + _secondsLeft;
    return _allSeconds;
  }

  String secondsToTimerFormat(int allSeconds) {
    int _minutes = allSeconds ~/ 60;
    int _seconds = allSeconds % 60;
    String _minutesFormat = _minutes.toString().padLeft(2, "0");
    String _secondsFormat = _seconds.toString().padLeft(2, "0");
    String output = _minutesFormat + ':' + _secondsFormat;
    return output;
  }

  secondsToDuration(int allSeconds) => Duration(seconds: allSeconds);
}
