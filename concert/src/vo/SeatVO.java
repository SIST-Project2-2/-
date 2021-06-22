package vo;

public class SeatVO extends VO{
	private static final long serialVersionUID = 1L;
	private int concert_no, order_no;
	private String id, seat_no;

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

	public String getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

}
