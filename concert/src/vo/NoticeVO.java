package vo;

public class NoticeVO  extends VO{
	private static final long serialVersionUID = 1L;
	private int no; // 공지사항 번호
	private String title; // 공지사항 제목
	private String content; // 공지사항 내용
	private String date; // 작성일자
	private String writer; // 작성자
	private int views; // 조회수
	private String tag; // 태그
	private String img; // 이미지명
	private String simg; // 저장된 이미지명
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getSimg() {
		return simg;
	}
	public void setSimg(String simg) {
		this.simg = simg;
	}
	
	public NoticeVO(int no, String title, String content, String date, String writer, int views, String tag, String img, String simg) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.date = date;
		this.writer = writer;
		this.views = views;
		this.tag = tag;
		this.img = img;
		this.simg = simg;
	}
	
	public NoticeVO(int no, String title, String content, String date, String writer, int views, String tag) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.date = date;
		this.writer = writer;
		this.views = views;
		this.tag = tag;
	}
	
	public NoticeVO(String title, String content, String tag) {
		super();
		this.title = title;
		this.content = content;
		this.tag = tag;
	}
	
	public NoticeVO() {
		
	}
	
	
}
