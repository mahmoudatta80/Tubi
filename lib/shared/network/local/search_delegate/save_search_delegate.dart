import 'package:flutter/material.dart';
import 'package:movie_app/modules/details/details.dart';
import 'package:movie_app/shared/network/local/state_management/my_provider.dart';
import 'package:movie_app/shared/styles/icons/icon_broken.dart';
import 'package:page_transition/page_transition.dart';

class SaveSearchDelegate extends SearchDelegate {
  List<Map> searchItem = MyProvider.searchForSavedMovie;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.close,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_outlined,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, String>> matchQuery = [];
    for (var name in searchItem) {
      if (name['title'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add({
          'title': name['title'],
          'id': name['id'],
        });
      }
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 8,
        bottom: 8,
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  child:  Details(
                    id: result['id']!,
                  ),
                  type: PageTransitionType.fade,
                ),
              );
            },
            child: ListTile(
              title: Text(result['title']!),
              trailing: const Icon(
                IconBroken.Arrow___Right_2,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, String>> matchQuery = [];
    for (var name in searchItem) {
      if (name['title'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add({
          'title': name['title'],
          'id': name['id'],
        });
      }
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 8,
        bottom: 8,
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  child:  Details(
                    id: result['id']!,
                  ),
                  type: PageTransitionType.fade,
                ),
              );
            },
            child: ListTile(
              title: Text(result['title']!),
              trailing: const Icon(
                IconBroken.Arrow___Right_2,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
