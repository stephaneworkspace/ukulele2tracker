class UkuHitBox {
  //final pYBegin = 40.0;
  final pXDiv6 = 300.0 / 5; // final pXDiv6 = size.width / 5; 
  final pY0Min = 0.0; // 
  final pY0Max = 40.0 + 14.0; // pYBegin + (strokeWidth * 3) + 2.0
  final _espacementY = 40.0;
  final pYBeginLigne1 = 40.0 + 12.0; //pYBegin + (strokeWidth * 3);

  int detectLine(double y) {
    if (y >= pY0Min && y <= pY0Max)
      return 0;
    else
      if (y >= pYBeginLigne1 && y <= pYBeginLigne1 + (_espacementY * 1))
        return 1;
      else
        if (y >= (pYBeginLigne1 + (_espacementY * 1.0)) && y <= (pYBeginLigne1 + (_espacementY * 2.0)))
          return 2;
        else
          if (y >= (pYBeginLigne1 + (_espacementY * 2.0)) && y <= (pYBeginLigne1 + (_espacementY * 3.0)))
            return 3;
          else
            if (y >= (pYBeginLigne1 + (_espacementY * 3.0)) && y <= (pYBeginLigne1 + (_espacementY * 4.0)))
              return 4;
            else
              if (y >= (pYBeginLigne1 + (_espacementY * 4.0)) && y <= (pYBeginLigne1 + (_espacementY * 5.0)))
                return 5;
              else
                if (y >= (pYBeginLigne1 + (_espacementY * 5.0)) && y <= (pYBeginLigne1 + (_espacementY * 6.0)))
                  return 6;
                else
                  if (y >= (pYBeginLigne1 + (_espacementY * 6.0)) && y <= (pYBeginLigne1 + (_espacementY * 7.0)))
                    return 7;
                  else
                    if (y >= (pYBeginLigne1 + (_espacementY * 7.0)) && y <= (pYBeginLigne1 + (_espacementY * 8.0)))
                      return 8;
                    else
                      if (y >= (pYBeginLigne1 + (_espacementY * 8.0)) && y <= (pYBeginLigne1 + (_espacementY * 9.0)))
                        return 9;
                      else
                        if (y >= (pYBeginLigne1 + (_espacementY * 9.0)) && y <= (pYBeginLigne1 + (_espacementY * 10.0)))
                          return 10;
                        else
                          if (y >= (pYBeginLigne1 + (_espacementY * 10.0)) && y <= (pYBeginLigne1 + (_espacementY * 11.0)))
                            return 11;
                          else
                            if (y >= (pYBeginLigne1 + (_espacementY * 11.0)) && y <= (pYBeginLigne1 + (_espacementY * 12.0)))
                              return 12;
                            else
                              return 0;
  }

  int detectColumn(double x) {
    if (x >= (pXDiv6 / 2) && x <= (pXDiv6 + (pXDiv6 / 2)))
      return 1;
    else
      if (x >= (pXDiv6 + (pXDiv6 / 2)) && x <= ((pXDiv6 * 2) + (pXDiv6 / 2)))
        return 2;
      else
        if (x >= ((pXDiv6 * 2) + (pXDiv6 / 2)) && x <= ((pXDiv6 * 3) + (pXDiv6 / 2)))
          return 3;
        else
          if (x >= ((pXDiv6 * 3) + (pXDiv6 / 2)) && x <= ((pXDiv6 * 4) + (pXDiv6 / 2)))
            return 4;
          else
            return -1;
  }
}