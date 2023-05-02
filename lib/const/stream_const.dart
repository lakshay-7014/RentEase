class StreamConst {
  static String streamImageConst(int i) {
    return 'assets/images/img$i.png';
  }

  static streamStringConst(int i) {
    switch (i) {
      case 1:
        return stream1;
      case 2:
        return stream2;
      case 3:
        return stream3;
      case 4:
        return stream4;
      case 5:
        return stream5;
      case 6:
        return stream6;
      case 7:
        return stream7;
      case 8:
        return stream8;
      case 9:
        return stream9;
      case 10:
        return stream10;
    }
  }

  static const String stream1 = 'Cars';
  static const String stream2 = 'Properties';
  static const String stream3 = 'Mobiles';
  static const String stream4 = 'Jobs';
  static const String stream5 = 'Bikes';
  static const String stream6 = 'Electronics';
  static const String stream7 = 'Furniture';
  static const String stream8 = 'Fashion';
  static const String stream9 = 'Books';
  static const String stream10 = 'Sports';
}
