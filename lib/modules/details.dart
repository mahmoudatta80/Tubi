import 'package:flutter/material.dart';
import 'package:movie_app/models/api_models/movie_model.dart';
import 'package:movie_app/models/db_models/save_model.dart';
import 'package:movie_app/modules/display.dart';
import 'package:movie_app/shared/network/local/state_management/my_provider.dart';
import 'package:movie_app/shared/network/remote/dio_helper.dart';
import 'package:movie_app/shared/styles/icon_broken.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  late String id;

  Details({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
      future: DioHelper.getMovieDetails(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Movie movie = snapshot.data!;
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  IconBroken.Arrow___Left,
                ),
              ),
              title: Text(
                'Details',
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              actions: [
                Consumer<MyProvider>(
                  builder: (context, myProvider, child) =>
                      !myProvider.saved[movie.rank]!
                          ? IconButton(
                              onPressed: () {
                                SaveModel saveModel = SaveModel({
                                  'rank': movie.rank,
                                  'year': movie.year,
                                  'title': movie.title,
                                  'rating': movie.rating,
                                  'image': movie.image,
                                  'description': movie.description,
                                  'genre': movie.genre[0],
                                  'id': movie.id,
                                });

                                myProvider
                                  ..insertToSaveList(saveModel)
                                  ..addToSaved(saveModel.rank);
                              },
                              icon: const Icon(
                                Icons.bookmark_border,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                SaveModel saveModel = SaveModel({
                                  'rank': movie.rank,
                                  'year': movie.year,
                                  'title': movie.title,
                                  'rating': movie.rating,
                                  'image': movie.image,
                                  'description': movie.description,
                                  'genre': movie.genre[0],
                                  'id': movie.id,
                                });

                                myProvider
                                  ..deleteFromSaveList(saveModel.rank)
                                  ..removeFromSaved(saveModel.rank);
                              },
                              icon: const Icon(
                                Icons.bookmark,
                              ),
                            ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 350,
                    child: Image.network(
                      movie.image,
                      fit: BoxFit.fitHeight,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          'https://www.globalsign.com/application/files/9516/0389/3750/What_Is_an_SSL_Common_Name_Mismatch_Error_-_Blog_Image.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
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
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 14,
                      start: 14,
                      end: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                movie.title,
                                style: Theme.of(context).textTheme.headline1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${movie.year}',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                              size: 20,
                            ),
                            Text(
                              movie.rating,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                movie.genre[0],
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
                          movie.description,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Director  :',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              '   ${movie.director[0]}',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Writers  :',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Text(
                                  '-   ',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Expanded(
                                  child: Text(
                                    movie.writers[index],
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorLight.withOpacity(.7),
                                      fontSize: 12,
                                      height: 1.3,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 3,
                          ),
                          itemCount: movie.writers.length,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 14,
                      end: 14,
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColorLight,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          const Size(
                            double.infinity,
                            50,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child:  Display(
                              movie: movie,
                            ),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Watch now',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Center(
              child: Column(
                children: [
                  const Icon(
                    IconBroken.Danger,
                    size: 60,
                  ),
                  Text(
                    'Please check your connect',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        );
      },
    );
  }
}
