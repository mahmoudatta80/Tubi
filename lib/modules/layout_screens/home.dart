import 'package:flutter/material.dart';
import 'package:movie_app/models/api_models/movie_model.dart';
import 'package:movie_app/modules/details.dart';
import 'package:movie_app/shared/network/local/search_delegate/movies_search_delegate.dart';
import 'package:movie_app/shared/styles/icon_broken.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatelessWidget {
  late List<Movie> movies;

  Home({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 14,
              end: 14,
              top: 14,
            ),
            child: GestureDetector(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: MoviesSearchDelegate(),
                );
              },
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    prefixIcon: const Icon(
                      IconBroken.Search,
                      color: Colors.black45,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'search title, genre and etc...',
                    helperStyle: TextStyle(
                      color: Theme.of(context).highlightColor,
                    ),
                ),
                enabled: false,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 14,
              end: 14,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'On Going Movie',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_control,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 280,
            child: ListView.builder(
              padding: const EdgeInsetsDirectional.only(
                start: 10,
                end: 10,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageTransition(
                          child:  Details(
                            id: movies[index + 15].id,
                          ),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    },
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: 220,
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      child: Image.network(
                        movies[index + 15].image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            'https://www.globalsign.com/application/files/9516/0389/3750/What_Is_an_SSL_Common_Name_Mismatch_Error_-_Blog_Image.jpg',
                            fit: BoxFit.cover,
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if(loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              itemCount: 15,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 14,
              end: 14,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'All Movies',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_control,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 14,
                  end: 14,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child:  Details(
                          id: movies[index].id,
                        ),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: 125,
                        width: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Image.network(
                          movies[index].image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              'https://www.globalsign.com/application/files/9516/0389/3750/What_Is_an_SSL_Common_Name_Mismatch_Error_-_Blog_Image.jpg',
                              fit: BoxFit.cover,
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if(loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColorLight,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movies[index].title,
                              style: Theme.of(context).textTheme.headline5,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                  size: 20,
                                ),
                                Text(
                                  movies[index].rating,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    movies[index].genre[0],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              movies[index].description,
                              style: Theme.of(context).textTheme.headline4,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Divider(
                    indent: 14,
                    endIndent: 14,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ],
            ),
            itemCount: movies.length,
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
