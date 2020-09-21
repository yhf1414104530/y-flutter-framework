/*
 * 项目名:    gma_law_flutter2
 * 包名
 * 文件名:    env
 * 创建时间:  2020-03-09 on 10:55
 * 描述:
 *
 * @author   YHF
 */


class Env {
  final String name;

  const Env._(this.name);

  static const Env dev = const Env._('dev');
  static const Env test = const Env._('test');
  static const Env testAlpha = const Env._('testAlpha');
  static const Env testBeta = const Env._('testBeta');
  static const Env pdt = const Env._('pdt');
  static const List<Env> values = [dev, test, testAlpha, testBeta, pdt];

  static Env _env = Env.pdt; // 默认是生产环境
  static Env get env => _env;

  static set env(Env value) => _env = value;

  static bool get isDev => _env == Env.dev;

  static bool get isTest =>
      [Env.test, Env.testAlpha, Env.testBeta].contains(_env);

  static bool get isTestAlpha => _env == Env.testAlpha;

  static bool get isTestBeta => _env == Env.testBeta;

  static bool get isPdt => _env == Env.pdt;
}
