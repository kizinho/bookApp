class ApiRoutes {
  //google api key
  static const String apiKey = '';
  //base routes
  static const String base = 'https://www.googleapis.com';
  static const String apiRoute = '$base/books/v1/';

  //all books
  static const String books = '$apiRoute/volumes?q=books&orderBy=newest&key=$apiKey';
  // https://www.googleapis.com/books/v1/volumes/volumeId
  // oogleapis.com/books/v1/volumes/zyTCAlFPjgYC
}
