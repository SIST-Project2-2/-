package vo;

public class MemberVO {

	private String no; // 회원번호
	private String id; // 아이디
	private String pw; // 비밀번호
	private String nickname; // 닉네임
	private String name; // 이름
	private String birthdate; // 생일
	private String sex; // 성별
	private String address; // 주소
	private String phone; // 전화번호
	private String authority; // 권한
	private String withdrawal; // 탈퇴 요청 여부

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getWithdrawal() {
		return withdrawal;
	}

	public void setWithdrawal(String withdrawal) {
		this.withdrawal = withdrawal;
	}

}