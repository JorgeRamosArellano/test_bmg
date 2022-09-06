import 'package:flutter/material.dart';
import 'package:test_bmg/models/models.dart';
import 'package:test_bmg/services/news_api.dart';
import 'package:test_bmg/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String categorySelected = 'entertainment';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 78, 78, 78),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 5),
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              CategoryList(
                categorySelected: (category) {
                  print(category);
                  categorySelected = category.toLowerCase();
                  setState(() {});
                },
              ),

              const SizedBox(height: 10),

              FutureBuilder<News?>(
                future:  HTTP.getNewsByCategory(categorySelected),
                builder: (context, snapshot) {
                  if(!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  }

                  final List<Article> myNews = snapshot.data!.articles!; 

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: myNews.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          CardNews(
                            index: index + 1,
                            name: myNews[index].source!.name!,
                            title: myNews[index].title!,
                            urlToImage: myNews[index].urlToImage!,
                            description: myNews[index].description!,
                          ),
                          const Divider(color: Colors.white),
                        ],
                      );
                    }),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
