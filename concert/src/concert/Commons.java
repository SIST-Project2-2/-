package concert;

import java.util.HashMap;

public class Commons {
	
	// db에 검색할 텍스트에 사용
	public static String s_string(String str) {
		return "%" + str + "%";
	}
	
	// 태그 분리할 때 쓰려고 만들었는데 일단은 보류
	public static String[] tag_split(String tags) {
		return tags.split("/");
	}
	
	// url과 파라미터를 입력받아 주어진 url에 get 형식으로 요청한다.
	public static String get_method(String url, HashMap<String, String> inputs ) {
		url += "?";
		for(String key : inputs.keySet()) {
			url += key + "=" + inputs.get(key) + "&";
		}
		return url.substring(0, url.length()-1);
	}
}
