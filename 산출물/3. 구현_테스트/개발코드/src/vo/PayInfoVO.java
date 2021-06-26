package vo;

import java.util.ArrayList;

public class PayInfoVO  extends VO{
	private static final long serialVersionUID = 1L;
	private int orderNo; // 주문 번호
	private int ConcertNo; // 콘서트 번호
	private String firstName; // 이름
	private String lastName; // 성
	private String hp; // 결제자 휴대폰 번호
	private String artist; // 아티스트
	private String title; // 콘서트명
	private String location; // 장소
	private String date; // 콘서트 날짜
	private ArrayList<String> seats; // 좌석 번호
	private int price; // 가격
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getConcertNo() {
		return ConcertNo;
	}
	public void setConcertNo(int concertNo) {
		ConcertNo = concertNo;
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
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
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
