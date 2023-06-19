enum RoundupMultipler { off, x1, x2, x3, x5, x10 }

extension RoundupMultiplerConfig on RoundupMultipler {
  String get value {
    switch (this) {
      case RoundupMultipler.off:
        return 'round up off';
      case RoundupMultipler.x1:
        return 'x1 round up';
      case RoundupMultipler.x2:
        return 'x2 round up';
      case RoundupMultipler.x3:
        return 'x3 round up';
      case RoundupMultipler.x5:
        return 'x5 round up';
      case RoundupMultipler.x10:
        return 'x10 round up';
    }
  }

  String get multiplier {
    switch (this) {
      case RoundupMultipler.off:
        return 'x0';
      case RoundupMultipler.x1:
        return 'x1';
      case RoundupMultipler.x2:
        return 'x2';
      case RoundupMultipler.x3:
        return 'x3';
      case RoundupMultipler.x5:
        return 'x5';
      case RoundupMultipler.x10:
        return 'x10';
    }
  }
}
