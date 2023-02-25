String capitalize(String cadena) {
  if (cadena.isEmpty) {
    return cadena;
  }
  return cadena[0].toUpperCase() + cadena.substring(1);
}
