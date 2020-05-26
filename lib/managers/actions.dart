///Redux actions
///
///
//são "construidas" as caracteristicas de acordo com os valores recebidos
class FontSize {
  //objecto que representa o tamanho da fonte
  final double payload;
  FontSize(this.payload);
}

class Bold {
  //objecto que representa se o texto é negrito ou não
  final bool payload;
  Bold(this.payload);
}

class Italic {
  //objecto que representa se o texto é itálico ou não
  final bool payload;
  Italic(this.payload);
}
