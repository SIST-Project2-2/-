package vo;

import java.util.ArrayList;

public class PayInfoVO {
	private int no; // 주문 번호
	private String firstName; // 이름
	private String lastName; // 성
	private String hp; // 결제자 휴대폰 번호
	private String date; // 콘서트 날짜
	private ArrayList<String> seats; // 좌석 번호
	private int price; // 가격
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public ArrayList<String> getSeats() {
		return seats;
	}
	public void setSeats(ArrayList<String> seats) {
		this.seats = seats;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
