import 'dart:convert';

class ObjectUtil {
  /// Returns true if the string is null or 0-length.
  static bool isEmptyString(str) {
    return str == null || str.isEmpty;
  }

  /// Returns true if the list is null or 0-length.
  static bool isEmptyList(list) {
    return list == null || list.isEmpty;
  }

  /// Returns true if there is no key/value pair in the map.
  static bool isEmptyMap(map) {
    return map == null || map.isEmpty;
  }

  /// Returns true  String or List or Map is empty.
  static bool isEmpty(object) {
    if (object == null) return true;
    if (object is String && object.isEmpty) {
      return true;
    } else if (object is List && object.isEmpty) {
      return true;
    } else if (object is Map && object.isEmpty) {
      return true;
    }
    return false;
  }

  /// Returns true String or List or Map is not empty.
  static bool isNotEmpty(Object object) {
    return !isEmpty(object);
  }

  /// Returns true Two List Is Equal.
  static bool twoListIsEqual(listA, listB) {
    if (listA == listB) return true;
    if (listA == null || listB == null) return false;
    int length = listA.length;
    if (length != listB.length) return false;
    for (int i = 0; i < length; i++) {
      if (!listA.contains(listB[i])) {
        return false;
      }
    }
    return true;
  }

  /*
  * Base64加密
  */
  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /*
  * Base64解密
  */
  static String decodeBase64(String data) {
    return String.fromCharCodes(base64Decode(data));
  }

  static String imgWaterStr(String data) {
    String sss = data + '?x-oss-process=image/resize,l_500';
    List imgUrls = sss.split('com/');
    String baseq = ObjectUtil.encodeBase64(imgUrls[1]).replaceAll('/', '_');
    String base64 = baseq.replaceAll('+', '-');
    String shareUrl =
        'https://cacart.oss-cn-hangzhou.aliyuncs.com/wxapp/group/share_bg.jpg?x-oss-process=image/resize,m_fill,h_400,w_500/watermark,image_${base64},g_center';
    return shareUrl;
  }

  static String waterBgAndString(String data) {
    print('arr-------------${data}');
    String baseq = ObjectUtil.encodeBase64(data).replaceAll('/', '_');
    print('arr-------------${baseq}');
    String base64 = baseq.replaceAll('+', '-');
    String shareUrl =
        'https://cacart.oss-cn-hangzhou.aliyuncs.com/wxapp/group/share_bg.jpg?x-oss-process=image/resize,m_fill,h_400,w_500/watermark,text_${base64},g_center';
    print('shareUrl-------------${shareUrl}');
    return shareUrl;
  }
}
