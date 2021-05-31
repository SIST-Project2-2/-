package vo;

public class OrderVO {
	private int no;
	private String id;
	private int concert_no;
	private String seat_no;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getConcert_no() {
		return concert_no;
	}

	public void setConcert_no(int concert_no) {
		this.concert_no = concert_no;
	}

	public String getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}
}
