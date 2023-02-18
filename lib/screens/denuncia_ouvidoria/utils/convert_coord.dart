String convertCoord(double value) {
  final coord = value;

  if (coord == 0) {
    return '';
  }

  // Converta a latitude e longitude em graus, minutos e segundos
  final coordDegrees = coord.floor();
  final coordMinutes = ((coord - coordDegrees) * 60).floor();
  final coordSeconds =
      ((coord - coordDegrees - coordMinutes / 60) * 3600).floor();

  // Formate a coorditude e longitude em graus, minutos e segundos
  final coordString =
      '$coordDegrees°${coordMinutes.toString().padLeft(2, '0')}\''
      '${coordSeconds.toString().padLeft(2, '0')}"';

  return coordString;
}
