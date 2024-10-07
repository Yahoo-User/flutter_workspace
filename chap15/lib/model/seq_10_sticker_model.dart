import '../util/logger.dart';


class StickerModel {
    final int id;
    final String imgPath;


    StickerModel({ required this.id, required this.imgPath}) {
        console('StickerModel(id: $id, imgPath: $imgPath) invoked.');
    }

    // *Important:
    //      If missing a corresponding override of 'hashCode', you must try (1) overriding 'hashCode' or (2) removing '=='.
    @override

    /*
    bool operator == (Object other) {   // 1st. method
        console('operator == ($other) invoked.');
        return (other is! StickerModel) ? false : (other.id == id);
    }
    */

    // 2nd. method
    bool operator == (Object other) => (other is! StickerModel) ? false: (other.id == id);


    // *Important:
    //      Getters must be declared *without a parameter list.
    @override

    /*
    int get hashCode {  // 1st. method
        console('hashCode(${id.hashCode}) invoked.');
        return id.hashCode;
    }
     */

    // 2nd. method
    int get hashCode => id.hashCode;
}


