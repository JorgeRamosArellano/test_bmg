// To parse this JSON data, do
//
//     final new = newFromJson(jsonString);

import 'dart:convert';


class News {
    News({
        this.status,
        this.totalResults,
        this.articles,
    });

    String? status;
    int? totalResults;
    List<Article>? articles;


    //factory News.FromString(String str) => News.fromJson(json.decode(str));

    factory News.fromJson(Map<String, dynamic> json) => News(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );
}

class Article {
    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime? publishedAt;
    String? content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'No especificado',
        title: json["title"],
        description: json["description"] ?? 'Sin descripción',
        url: json["url"],
        urlToImage: json["urlToImage"] ?? 'https://www.allianceplast.com/wp-content/uploads/no-image-1024x1024.png',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? 'No content',
    );
}

class Source {
    Source({
        this.id,
        this.name,
    });

    dynamic id;
    String? name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"] ?? 'Sin nombre',
    );
}
