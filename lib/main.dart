import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageSize = 20;
  int page = 0;
  late ScrollController _controller;
  List<String> imageUrls = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/200',
    'https://via.placeholder.com/250',

    /// scroll to this stop
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/350',

    /// init first stop
    'https://via.placeholder.com/400',
    'https://via.placeholder.com/450',
    'https://via.placeholder.com/500',

    /// scroll to this stop
    'https://via.placeholder.com/550',
    'https://via.placeholder.com/600',
    'https://via.placeholder.com/650',
    'https://via.placeholder.com/700',
    'https://via.placeholder.com/750',
    'https://via.placeholder.com/800',
    'https://via.placeholder.com/850',
    'https://via.placeholder.com/900',
    'https://via.placeholder.com/950',
    'https://via.placeholder.com/1000',
    'https://via.placeholder.com/1050',
    'https://via.placeholder.com/1100',
  ];

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(onListening);
  }
/// This method is called when the user scrolls to the end of the list
  /// and the [ScrollController] is listening
  void onListening() {
    final middle = _controller.position.maxScrollExtent / 2;
    if (_controller.position.pixels >= middle) {
      getMoreData();
    }
  }
  /// This method is called when the user scrolls to the end of the list

  void getMoreData() {
    if (page * pageSize >= imageUrls.length) {
      return;
    }
    setState(() {
      page++;
    });
  }
  /// This method is called when the user scrolls to the end of the list
  int get itemCount => (page + 1) * pageSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          controller: _controller,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            /// This is the last item
            if (index < imageUrls.length) {
              return Center(
                child: Image.network(
                  imageUrls[index],
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              );
            } else {
              // You can display a loading indicator at the end of the list
              return Container();
            }
          },
        ),
      ),
    );
  }
}
