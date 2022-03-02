class ParseService {
  String durationToTimerFormat(Duration _duration) {
    int _minutes = _duration.inMinutes;
    int _seconds = _duration.inSeconds % 60;
    String _minutesFormat = _minutes.toString().padLeft(2, "0");
    String _secondsFormat = _seconds.toString().padLeft(2, "0");
    String output = _minutesFormat + ':' + _secondsFormat;
    return output;
  }

  int durationToSeconds(Duration _duration) {
    int _minutes = _duration.inMinutes;
    int _secondsLeft = _duration.inSeconds % 60;
    int _allSeconds = _minutes * 60 + _secondsLeft;
    return _allSeconds;
  }

  String secondsToTimerFormat(int _allSeconds) {
    int _minutes = _allSeconds ~/ 60;
    int _seconds = _allSeconds % 60;
    String _minutesFormat = _minutes.toString().padLeft(2, "0");
    String _secondsFormat = _seconds.toString().padLeft(2, "0");
    String output = _minutesFormat + ':' + _secondsFormat;
    return output;
  }
}
