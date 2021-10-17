const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
exports.createUser = functions.auth.user().onCreate(user => {
    return admin.firestore().collection("users").doc(user.uid);

});
exports.deleteUser = functions.auth.user().onDelete(user => {
    const doc = admin.firestore().collection("users").doc(user.uid);
    return doc.delete();
});

exports.addFavorite = functions.https.onCall((data,context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "only authenticated users can add to favorite"
      );
    }
    return admin.firestore().collection("favorites").add({
        bookId: data.bookId,
        userId:  data.userId,
        title:  data.title,
        image:  data.image,
        rating:  data.rating,
        author:  data.author,
        category:  data.category,
        publishedDate:  data.publishedDate,
        description:  data.description,
        buy:  data.buy,
        available:  data.available,
        amount:  data.amount,
        url:  data.url,
        preview:  data.preview,
        createdAt:   data.createdAt
      });
  });