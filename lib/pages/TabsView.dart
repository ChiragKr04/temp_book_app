import 'package:book_app/pages/HomeView/HomeView.dart';
import 'package:book_app/pages/ShopView/ShopView.dart';
import 'package:book_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppTabViews { Home, Shop }

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  Rx<AppTabViews> currentView = AppTabViews.Home.obs;
  RxInt currentIndex = 0.obs;

  void search() {
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(
        goToBookStore: (value) {
          currentView.value = AppTabViews.Shop;
          currentIndex.value = 1;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => search(),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: const Text('Book App'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        search();
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _getNavBar(),
        body: Obx(() => _getBody()),
      ),
    );
  }

  Widget _getBody() {
    switch (currentView.value) {
      case AppTabViews.Home:
        return HomeView();
      case AppTabViews.Shop:
        return ShopView();
    }
  }

  Widget _getNavBar() {
    return Obx(
      () => NavigationBar(
        selectedIndex: currentIndex.value,
        indicatorColor: Colors.blue,
        onDestinationSelected: (index) {
          currentIndex.value = index;
          switch (index) {
            case 0:
              currentView.value = AppTabViews.Home;
              break;
            case 1:
              currentView.value = AppTabViews.Shop;
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({
    required this.goToBookStore,
  });
  final Function(bool) goToBookStore;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  void showResults(BuildContext context) async {
    super.showResults(context);
    await Navigator.pushNamed(
      context,
      CustomRoutes.bookQueryViewRoute,
      arguments: {
        "query": query,
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Popular Books"),
          leading: const Icon(
            Icons.book_outlined,
            color: Colors.blue,
          ),
          onTap: () async {
            query = "Popular Books";
            showResults(context);
          },
        ),
        ListTile(
          title: const Text("Top Selling"),
          leading: const Icon(
            Icons.trending_up,
            color: Colors.blue,
          ),
          onTap: () {
            query = "Top Selling";
            showResults(context);
          },
        ),
        ListTile(
          title: const Text("New Releases"),
          leading: const Icon(
            Icons.new_releases_outlined,
            color: Colors.blue,
          ),
          onTap: () {
            query = "New Releases";
            showResults(context);
          },
        ),
        ListTile(
          title: const Text("Bookstore"),
          leading: const Icon(
            Icons.store_outlined,
            color: Colors.blue,
          ),
          onTap: () {
            query = "Bookstore";
            goToBookStore(true);
            close(context, null);
          },
        ),
      ],
    );
  }
}
