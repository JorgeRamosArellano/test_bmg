import 'package:flutter/material.dart';

class CardNews extends StatelessWidget {
  final int index;
  final String name;
  final String title;
  final String urlToImage;
  final String description;

  CardNews({
    Key? key,
    required this.index,
    required this.name,
    required this.title,
    required this.urlToImage,
    required this.description,
  }) : super(key: key);

 bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('$index. ', style: const TextStyle(color: Colors.red)),
              Text(name),
            ],
          ),
          SizedBox(height: size.width * 0.03),

          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.07
            ),
          ),
          SizedBox(height: size.width * 0.03),

          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: Image.network(urlToImage),
          ),
          SizedBox(height: size.width * 0.03),

          Text(description),
          SizedBox(height: size.width * 0.03),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatefulBuilder(
                builder:(_, setStateBuilder) {

                  return MaterialButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: isFavorite ? const Icon(Icons.star, color: Colors.white) : const Icon(Icons.star_border, color: Colors.white),
                  onPressed: () {
                    isFavorite = !isFavorite;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: isFavorite ? const Text('Agregado a favoritos'): const Text('Eliminado de favoritos'),
                      )
                    );
                    setStateBuilder((){});
                  },
                );
                },
              ),
              SizedBox(width: size.width * 0.05),

              MaterialButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Icon(Icons.more, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: size.width * 0.05),
        ],
      ),
    );
  }
}
