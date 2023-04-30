import 'package:flutter/material.dart';
import 'package:movie_app/models/db_models/save_model.dart';
import 'package:movie_app/modules/details.dart';
import 'package:movie_app/shared/network/local/state_management/my_provider.dart';
import 'package:movie_app/shared/network/local/search_delegate/save_search_delegate.dart';
import 'package:movie_app/shared/styles/icon_broken.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Save extends StatelessWidget {
  const Save({Key? key}) : super(key: key);

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
                  delegate: SaveSearchDelegate(),
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
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 14,
              end: 14,
              top: 14,
              bottom: 14,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Saved Movies',
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
          Consumer<MyProvider>(
            builder: (context, myProvider, child) => FutureBuilder(
              future: myProvider.readAllSaveList(),
              builder: (context, AsyncSnapshot? snapshot) {
                if (!snapshot!.hasData) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 140,
                      ),
                      CircularProgressIndicator(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ],
                  );
                } else {
                  if (snapshot.data.length == 0) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        const Icon(
                          IconBroken.Document,
                          size: 90,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Saved list is empty',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    );
                  }
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      SaveModel saveModel =
                      SaveModel.fromJson(snapshot.data[index]);
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
                                  id: saveModel.id,
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
                                  saveModel.image,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      'https://www.globalsign.com/application/files/9516/0389/3750/What_Is_an_SSL_Common_Name_Mismatch_Error_-_Blog_Image.jpg',
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
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
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      saveModel.title,
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
                                          saveModel.rating,
                                          style: Theme.of(context).textTheme.headline2,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Text(
                                            saveModel.genre,
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
                                      saveModel.description,
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
                    itemCount: snapshot.data.length,
                  );
                }
              },
            ),
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}