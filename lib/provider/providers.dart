import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'customer_provider.dart';

class Providers{
  static List<SingleChildWidget> getProvider = [

    ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),

  ];
}