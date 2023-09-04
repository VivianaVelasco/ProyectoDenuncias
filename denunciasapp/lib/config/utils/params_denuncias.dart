class ParamsDenuncias {
  final int idParroquia;
  final int idMotivo;

  ParamsDenuncias({required this.idParroquia, required this.idMotivo});

  String getParams() {
    String params = "";
    if (idParroquia != 0) params += "parroquia=$idParroquia";
    if (idMotivo != 0) params += "motivo=$idMotivo";
    return params;
  }
}
