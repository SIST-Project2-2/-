package concert;

import vo.PageVO;

public class Commons {

	
	
	public PageVO getPage(int count, int nowPage) {
		int post_per_page = 10; // 한 페이지당 보여지는 게시글 수
		PageVO vo = new PageVO();
		
		int total_page = count / post_per_page; // 전체 페이지 수
		if(count % post_per_page != 0) {
			total_page ++;
		} 
		
		vo.setTotal(total_page);
		
		// 현 페이지가 1인 경우 이전 버튼 비활성화
		if(nowPage == 1) { 
			vo.setPrev(false);
		}else {
			vo.setPrev(true);
		}
		
		// 현 페이지가 마지막 페이지인 경우 다음 버튼 비활성화
		if(nowPage == total_page) { 
			vo.setNext(false);
		}else {
			vo.setNext(true);
		}
		
		// 보여지는 페이지 중 시작 페이지와 끝 페이지
		if(nowPage <= 5) { // 현 페이지가 5페이지 이내일 경우
			vo.setStart(1);
			vo.setEnd(total_page);
		}else if(total_page - nowPage <= 2) { // 현 페이지가 뒤에서 2번째 이내일 경우
			vo.setStart(total_page - 4);
			vo.setEnd(total_page);;
		}else { // 그 외의 경우
			vo.setStart(nowPage - 2);
			vo.setEnd(nowPage + 2);
		}
		
		return vo;
	}
}
