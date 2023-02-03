void main() {
  //Convert strings, ints, and doubles

  var a, b, c;
  a = 40;
  b = "1";
  c = a + int.parse(b);
  print(c);

  //String to double
  var e, f, d;
  e = 40;
  f = "0.1";
  d = e + double.parse(f);
  print(d);

  //int to string
  var g, h, i;
  g = 40;
  h = "1";
  i = g.toString() + h;
  print(i);
}
