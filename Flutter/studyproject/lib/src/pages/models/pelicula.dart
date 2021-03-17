class Peliculas {

  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList( List<dynamic> jsonList ) {

    if ( jsonList == null) return;

    for ( var item in jsonList ){

      final pelicula = new Pelicula.fromJsonMap(item);
      items.add( pelicula ); 

    }
  }
}

class Pelicula {
  int voteCount;
  int id;
  double voteAverage;
  String title;
  String video;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backgrounds;
  bool adult;
  String overiew;
  String realeaseDate;

  Pelicula({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.genreIds,
    this.adult,
    this.backgrounds,
    this.originalTitle,
    this.overiew,
    this.realeaseDate,
});

Pelicula.fromJsonMap( Map<String,dynamic> json ){

  voteCount        = json['vote_Count'];
  id               = json['id'];
  video            = json['video'];
  voteAverage      = json['vote_Average'] / 1;
  title            = json['title'];
  popularity       = json['popularity'] / 1;
  posterPath       = json['poster_Path'];
  originalLanguage = json['original_Language'];
  genreIds         = json['genre_Ids'].cast<int>();
  adult            = json['adult'];
  backgrounds      = json['backgrounds'];
  originalTitle    = json['original_Title'];
  overiew          = json['overiew'];
  realeaseDate     = json['realease_Date'];

}

}