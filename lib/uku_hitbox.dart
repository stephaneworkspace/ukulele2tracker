class UkuHitBox {
  final pXDiv6 = 300.0 / 5; // final pXDiv6 = size.width / 5; 
  int detectLigne() {
    return 0;
  }
  int detectColonne(double a) {
    if (a >= (pXDiv6 / 2) && a <= (pXDiv6 + (pXDiv6 / 2)))
      return 1;
    else
      return 2;
  }
}