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
	
	// 현재 url과 파라미터 값의 주어진 페이지를 불러온다.
	public static String get_page(String url, HashMap<String, Object> inputs, int pageNumber) {
		inputs.put("pageNumber", pageNumber);
		url += "?";
		for(String key : inputs.keySet()) {
			url += key + "=" + inputs.get(key) + "&";
		}
		return url.substring(0, url.length()-1); // 마지막에 붙는 &는 제외
	}
}
