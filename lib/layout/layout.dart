import 'package:flutter/material.dart';
import 'package:movie_app/modules/layout_screens/home.dart';
import 'package:movie_app/modules/layout_screens/profile.dart';
import 'package:movie_app/modules/layout_screens/save.dart';
import 'package:movie_app/shared/network/local/state_management/my_provider.dart';
import 'package:movie_app/shared/network/remote/dio_helper.dart';
import 'package:movie_app/shared/styles/icon_broken.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/models/api_models/movie_list.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, myProvider, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              IconBroken.Notification,
            ),
            onPressed: () {},
          ),
          title: Text(
            'Tubi',
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                IconBroken.Filter,
              ),
              onPressed: () {
                myProvider.changeAppMode();
              },
            ),
          ],
        ),
        body: FutureBuilder<MovieList>(
          future: DioHelper.getAllMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Widget> screens = [
                Home(movies: snapshot.data!.mainData),
                const Save(),
                const Profile(),
              ];
              return screens[myProvider.currentIndex];
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      IconBroken.Danger,
                      size: 90,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Please check your connect',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColorLight,
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(
                30,
              ),
              topLeft: Radius.circular(
                30,
              ),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: const EdgeInsets.all(
            4,
          ),
          child: Consumer<MyProvider>(
            builder: (context, myModel, child) => BottomNavigationBar(
              currentIndex: myModel.currentIndex,
              iconSize: 24,
              onTap: (index) {
                myModel.changeCurrentIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Bookmark,
                  ),
                  label: 'Save',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Profile,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
