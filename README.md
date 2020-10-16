# Y-Framework
#### 简介

##### Y-Framework是基于Bloc封装的一套快速开发框架，主要用于辅助业务开发，项目中包括持久层（Net+LocalCache），基础服务模块（设备服务，缓存服务，日志服务等）以及基础常用工具类

#### 状态管理使用

- 在 pubspec.yaml 中增加库引用
```
 y_framework:
    git:
      url: git://github.com/yhf1414104530/y-flutter-framework.git
```
- 创建一个基础的业务模块（通过Y-bloc插件快速构建）

```
part 'test_event.dart';
part 'test_state.dart';
///bloc 为业务领域控制中心
class TestBloc extends BaseLoadBloc<TestEvent, TestState> {
  TestBloc(ViewToBloc viewToPresenter) : super(viewToPresenter, TestInitial(1));

  void test() {
    var i = state.num + 1;
    add(ChangeDataEvent(i));
  }

  void testTwo() {
    var i = state.num + 1;
    add(ChangeDataLoadingEvent(i));
  }
}

///事件中心
class ChangeDataEvent extends TestEvent {
  final int data;

  ChangeDataEvent(this.data);

  @override
  Stream<TestState> applyAsync({TestBloc bloc, TestState currentState}) async* {
  ///页面设置为加载状态
    bloc.pageLoading();
    await Future.delayed(Duration(seconds: 2));
    ///页面设置为加载成功状态
   bloc.pageSuccess();
    yield TestInitial(data);
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$data';
  }
}

///状态数据中心
@immutable
abstract class TestState {
  final int num;

  TestState(this.num);

  @override
  String toString() {
    // TODO: implement toString
    return '$num';
  }
}

class TestInitial extends TestState {
  TestInitial(int num) : super(num);
}


事件流程为：Bloc->add(Event())-yield setState(data);
```
- Widget状态引用

```
///创建Bloc对象
TestBloc _testBloc = TestBloc();

///使用BlocBuilder包裹，定义范型Bloc以及State
BlocBuilder<TestBloc, TestState>(
      builder: (_, state) {
        return Text(state.num);
      },
      cubit: _testBloc,
    );
```

- BaseAppBloc 与 BaseLoadBloc

```
BaseLoadBloc：当业务处理需要有UI交互时使用。
例如请求网络前需要设置页面为页面加载状态：
bloc.pageLoading();
bloc.view.toast('xxx')
使用BaseLoadBloc时，在page部分需要使用BlocLoadContainer包裹

BaseAppBloc：当业务处理不需要有UI交互时使用。
```
####  持久化BaseProvider<T>

```
先创建一个类继承BaseProvider，如果需要序列化则在范型中定义具体类型

class HomeAdProvider extends BaseProvider<AdInfoEntity>{

  @override
  // TODO: implement requestBean
  RequestBean get requestBean => RequestBean(ApiAddress.adHomePage, {},requestType: RequestType.GET);

}


///网络请求数据装配
class RequestBean {

  ///请求地址
  final String requestUrl;
  ///请求参数
  final Map<String, dynamic> requestParams;
  ///body json参数
  final String requestJson;
  ///请求类型
  RequestType requestType;

  /// if [isCacheLocal] is true ，I cache the data requested by the network locally
  final bool isCacheLocal;
  ///缓存标记
  final String cacheTag;
}

使用：
///加载网络数据
await HomeAdProvider().load();

///加载本地数据
await HomeAdProvider().loadLocal();

```
####  列表加载（通过数据驱动List加载）
- 实现 ViewToBloc
```
项目中继承BaseBlocState即可

```
- 定义ListRefreshBloc T为模型序列化的类型

```
  ListRefreshBloc<T> _listRefreshBloc=ListRefreshBloc(
        this,
        RequestBean(ApiAddress.searchGoodsList, {'spuIds': widget.spuIds},
            requestType: RequestType.GET));
```
- widget使用

```
XyListRefresh<T>(
              listRefreshBloc: _listRefreshBloc,
              listRefreshBuilder: (list) {
                return ListView.builder(
                  itemBuilder: (_, index) {
                    return Widget;
                  },
                  itemCount: list.length,
                );
              })
```


####  Log

- 导入包
```
import 'package:y_framework/service/index.dart';
```

- 使用
```
///初始化Log，可以配置日志过滤以及打印规则

Log.init(
        filter: LogFilterDelegate(),
        printer: PrettyPrinter(
            colors: false,
            printEmojis: false,
            printTime: false,
            methodCount: 8));

Log.d('xxx')
Log.i('xxx')
Log.e('xxx')
Log.w('xxx')
```
####  框架中的拦截器配置

- Bloc拦截器（负责拦截bloc中的事件，状态变更以及统一容错处理）

```
 Bloc.observer = YDefaultBlocDelegate();

 class YDefaultBlocDelegate extends BlocObserver with ErrorDeal {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    Log.d(event.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(cubit, error, stackTrace);
    if (cubit is BaseLoadBloc) {
      if (cubit.isLoading()) {
        if (error is FormatException) {
          cubit.pageError(error);
        }else{
          cubit.pageError(Exception('Error'));
        }
      }
    }
    if (error is DomainException) {
      Toast.showToast(error.message);
    } else if (error is ServiceException || error is DioError) {
      Toast.showToast('网络错误');
    }
    Log.d('$error===$cubit==$stackTrace');
  }

  @override
  void onChange(Cubit cubit, Change change) {
    // TODO: implement onChange
    super.onChange(cubit, change);
  }
}

```
- Log拦截器（负责日志拦截）

```
///当前主要用于环境对日志打印的影响
class LogFilterDelegate extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (Env.isPdt && event.level == Level.info) {
      return true;
    }
    if (!Env.isPdt) {
      return true;
    }
    return false;
  }
}

```
####  框架特性
- 事件驱动 （支持复用、有良好的扩展性、简化客户代码）
- 集中收集 分步治理（事件，状态变更，错误收集，日志）
- 遵循开闭原则，框架提供更多的可配置项便于业务变更
- 遵循易用性原则，简化应用层调用，开箱即用，语义清晰
- 依赖注入，将每个业务的元数据交给Bloc控制中心处理，降低引用复杂度
