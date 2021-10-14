class ApiRoutes {
  //google api key
  static const String apiKey = 'AIzaSyDW658W30aO7Evy4EbXwyG44gGS3QT1eHw';
  //base routes
  static const String base = 'https://www.googleapis.com';
  static const String apiRoute = '$base/books/v1';
  //avatar
  static const String avatar = 'https://e7.pngegg.com/pngimages/1008/377/png-clipart-computer-icons-avatar-user-profile-avatar-heroes-black-hair.png';
  //all books
  static const String relevance = '$apiRoute/volumes?q=books+inauthor&orderBy=relevance&maxResults=30&key=$apiKey';
  static const String books = '$apiRoute/volumes?q=books+inauthor&orderBy=newest';
  static const bookNoImage = 'https://islandpress.org/sites/default/files/default_book_cover_2015.jpg';

  // https://www.googleapis.com/books/v1/volumes/volumeId
  // oogleapis.com/books/v1/volumes/zyTCAlFPjgYC
  // https://www.googleapis.com/books/v1/volumes?q=books+inauthor&orderBy=newest
}
//
// https://www.googleapis.com/books/v1/volumes?q=books+inauthor&orderBy=relevance&key=AIzaSyDW658W30aO7Evy4EbXwyG44gGS3QT1eHw