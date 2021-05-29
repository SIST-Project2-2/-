package vo;

public class PageVO { // 페이징을 위한 데이터를 담는 VO 객체
	private boolean next; // 다음 버튼 존재 여부
	private boolean prev; // 이전 버튼 존재 여부
	private int total; // 전체 페이지 수
	private int start; // 표시되는 페이지 중 맨 앞
	private int end; // 표시되는 페이지 중 맨 뒤
	private int location; // 현 페이지 버튼 위치
	
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
}