package vo;

public class SeatVO {
	private int seat_no, concert_no;
	private String id, seat_class;

	public int getConcert_no() {
		return concert_no;
	}

	public void setConcert_no(int concert_no) {
		this.concert_no = concert_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSeat_class() {
		return seat_class;
	}

	public void setSeat_class(String seat_class) {
		this.seat_class = seat_class;
	}

	public int getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
}
