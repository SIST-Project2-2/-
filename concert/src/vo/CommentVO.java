package vo;

public class CommentVO extends VO {
	private static final long serialVersionUID = 1L;
	private int no; // 댓글 번호
	private String artist; // 아티스트 이름
	private String id; // 작성자 ID
	private String content; // 작성 내용
	private int report; // 신고 수
	private int recommend; // 추천 수
	private String date; // 작서 일자

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
