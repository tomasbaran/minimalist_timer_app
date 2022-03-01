class ParseService {
  durationToTimerFormat(Duration _duration) {
    int _minutes = _duration.inMinutes;
    int _seconds = _duration.inSeconds % 60;
    String _minutesFormat = _minutes.toString().padLeft(2, "0");
    String _secondsFormat = _seconds.toString().padLeft(2, "0");
    String output = _minutesFormat + ':' + _secondsFormat;
    return output;
  }
}
