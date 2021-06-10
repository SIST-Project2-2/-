package concert;

import java.util.HashMap;

public class Commons {
	
	// db에 검색할 텍스트에 사용
	public static String s_string(String str) {
		return "%" + str + "%";
	}
	
	// 현재 url과 파라미터 값의 주어진 페이지를 불러온다.
	public static String get_page(String url, HashMap<String, String[]> inputs, int pageNumber) {
		String[] pageInput = {String.valueOf(pageNumber)};
		inputs.put("pageNumber", pageInput);
		url += "?";
		for(String key : inputs.keySet()) {
			url += key + "=" + inputs.get(key)[0] + "&";
		}
		return url.substring(0, url.length()-1); // 마지막에 붙는 &는 제외
	}
	
	// 현재 페이지의 파라미터를 포함한 주소를 출력한다.
	public static String get_page(String url, HashMap<String, String[]> inputs) {
		url += "?";
		for(String key : inputs.keySet()) {
			url += key + "=" + inputs.get(key)[0] + "&";
		}
		return url.substring(0, url.length()-1); // 마지막에 붙는 &는 제외
	}
	
	// PageVO를 설정하는 함수
	public static HashMap<String, Integer> getPageInfo(int count, int nowPage, int post_per_page) {
		HashMap<String, Integer> info = new HashMap<String, Integer>();
		int totalPage = count / post_per_page; // 전체 페이지 수
		if(count % post_per_page != 0) {
			totalPage ++;
		} 
		
		info.put("totalPage", totalPage);
		//vo.setTotal(total_page);
		
		// 현 페이지가 1인 경우 이전 버튼 비활성화
		if(nowPage == 1) { 
			info.put("prev", 0);
			//vo.setPrev(false);
		}else {
			info.put("prev", 1);
			//vo.setPrev(true);
		}
		
		// 현 페이지가 마지막 페이지인 경우 다음 버튼 비활성화
		if(nowPage == totalPage || totalPage == 0) {
			info.put("next", 0);
			//vo.setNext(false);
		}else {
			info.put("next", 1);
			//vo.setNext(true);
		}
		
		// 보여지는 페이지 중 시작 페이지와 끝 페이지
		if(nowPage <= 5) { // 현 페이지가 5페이지 이내일 경우
			info.put("start", 1);
			info.put("end", totalPage);
			//vo.setStart(1);
			//vo.setEnd(total_page);
		}else if(totalPage - nowPage <= 2) { // 현 페이지가 뒤에서 2번째 이내일 경우
			info.put("start", totalPage - 4);
			info.put("end", totalPage);
			//vo.setStart(total_page - 4);
			//vo.setEnd(total_page);
		}else { // 그 외의 경우
			info.put("start", nowPage - 2);
			info.put("end", nowPage + 2);
			//vo.setStart(nowPage - 2);
			//vo.setEnd(nowPage + 2);
		}
		
		return info;
	}
}
