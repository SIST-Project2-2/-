package vo;

public class ArtistVO extends VO {
	private static final long serialVersionUID = 1L;
	private int no;
	private String name;
	private String content;
	private String img;
	private String simg;

	public int getNo() {
		return no;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
