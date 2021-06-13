package vo;

public class ConcertVO extends VO {

	// Field
	private static final long serialVersionUID = 1L;
	private int no = -1, price = -1;
	private String artist;
	private String title;
	private String content;
	private String cdate;
	private String location;

	public String toString() {
		String json = "ConcertVO {";

		if (no != -1) {
			json += "no: " + this.no + ", ";
		}

		if (artist != null) {
			json += "artist: " + this.artist + ", ";
		}

		json += "}";
		return json;
	}

	// Method
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
