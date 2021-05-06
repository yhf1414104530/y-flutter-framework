/*
 * 项目名:    gma_law_flutter2
 * 包名
 * 文件名:    data_change_widget
 * 创建时间:  2020/7/27 on 11:32 AM
 * 描述:
 *
 * @author   YHF
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:y_framework/service/data_change/bloc/bloc.dart';

class DataChangeWidget<T> extends StatelessWidget {
  final DataChangeBloc<T> dataChangeBloc;
  final BlocWidgetBuilder<DataChangeState<T>> child;

  const DataChangeWidget(
      {Key key, @required this.dataChangeBloc, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataChangeBloc<T>, DataChangeState<T>>(
      builder: (BuildContext context, DataChangeState<T> state) {
        return child(context, state);
      },
      bloc: dataChangeBloc,
    );
  }
}
