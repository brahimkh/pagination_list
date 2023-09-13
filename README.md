# pagination_list
# Pagination list for logically pagination
``` dart
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
```

## Render widget 
``` dart
ListView.builder(
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
```