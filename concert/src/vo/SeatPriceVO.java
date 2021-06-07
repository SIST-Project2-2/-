package vo;

public class SeatPriceVO {
	private int concert_no, seat_price;
	private String seat_class;

	public int getConcert_no() {
		return concert_no;
	}

	public void setConcert_no(int concert_no) {
		this.concert_no = concert_no;
	}

	public int getSeat_price() {
		return seat_price;
	}

	public void setSeat_price(int seat_price) {
		this.seat_price = seat_price;
	}

	public String getSeat_class() {
		return seat_class;
	}

	public void setSeat_class(String seat_class) {
		this.seat_class = seat_class;
	}
}
