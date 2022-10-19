import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  List<DocumentSnapshot> bookmarkList = [];
  bool isBookmakrked = false;

  BookmarkCubit() : super(const BookmarkInitial());

  Future<void> checkExists(DocumentSnapshot doc) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("bookmarks")
        .where("timestamp", isEqualTo: doc['timestamp'])
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      isBookmakrked = true;
      emit(const Bookmarked());
    }
  }

  Future<void> saveBookMark(DocumentSnapshot doc) async {
    await FirebaseFirestore.instance.collection("bookmarks").doc().set({
      "date": doc['date'],
      "headline": doc['headline'],
      "image": doc['image'],
      "link": doc['link'],
      "story": doc['story'],
      "taptext": doc['taptext'],
      "timestamp": doc['timestamp'],
    });
    emit(const BookmarkSaved());
  }

  Future<void> removeBookmark(DocumentSnapshot doc) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("bookmarks")
        .where("timestamp", isEqualTo: doc['timestamp'])
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      await querySnapshot.docs[0].reference.delete();
    }
    emit(const BookmarkRemoved());
  }
}
