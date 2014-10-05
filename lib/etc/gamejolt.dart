part of viltage;

class GameJolt {
  static String base = "http://gamejolt.com/api/game/v1/scores/add/?";

  static addHighscoreGuest(String key, String game_id, String score, String scoreSort, String guestName) {
    _addHighscore(key, game_id, score, scoreSort, guestName:guestName);
  }
  
  static addHighscoreUser(String key, String game_id, String score, String scoreSort, String userName, String userToken) {
    _addHighscore(key, game_id, score, scoreSort, userName:userName, userToken:userToken);
  }
  
  static _addHighscore(String key, String game_id, String score, String scoreSort, {String userName, String userToken, String guestName}) {
    String prefix;
    
    if(userName != null) {
      prefix = "http://gamejolt.com/api/game/v1/scores/add/?game_id$game_id&guest=$guestName";
    } else if(guestName != null){
      prefix = "http://gamejolt.com/api/game/v1/scores/add/?game_id$game_id&username=$userName&user_token=$userToken";
    } else return;
    
    String url = "$prefix&score=$score&sort=$scoreSort&format=keypair";
    var sign = CryptoUtils.bytesToHex((new MD5()..add((url+key).codeUnits)).close());
    var request = HttpRequest.getString(url+"&signature="+sign).then(onDataLoaded);
    HttpRequest hr = new HttpRequest();
    
    if(printResponse) print(url+"&signature="+sign);
  }
  
  static bool printResponse = false;
  static void onDataLoaded(String responseText) {
    if(printResponse) print(responseText);
  }
}