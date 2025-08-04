class Formula {
  // Persegi
  static double luasPersegi(double sisi) => sisi * sisi;
  static double kelilingPersegi(double sisi) => 4 * sisi;

  // Balok
  static double volumeBalok(double p, double l, double t) => p * l * t;
  static double luasPermukaanBalok(double p, double l, double t) =>
      2 * (p * l + p * t + l * t);
}
