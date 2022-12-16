package domino.dto;

import java.sql.Date;

public class MemberDTO {

	private String member_id;		// 회원ID
	private String name;			// 이름
	private String pw;				// 비밀번호
	private int birth_type;			// 양력음력
	private Date birth;				// 생년월일
	private String tel;				// 휴대전화
	private String email;			// 이메일
	private String gender;			// 성별
	private int info_date;			// 개인정보유효기간
	private String mania_rank;		// 매니아등급
	private int sns_pan;			// SNS팬
	private Date join_date;			// 가입날짜
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getBirth_type() {
		return birth_type;
	}
	public void setBirth_type(int birth_type) {
		this.birth_type = birth_type;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getInfo_date() {
		return info_date;
	}
	public void setInfo_date(int info_date) {
		this.info_date = info_date;
	}
	public String getMania_rank() {
		return mania_rank;
	}
	public void setMania_rank(String mania_rank) {
		this.mania_rank = mania_rank;
	}
	public int getSns_pan() {
		return sns_pan;
	}
	public void setSns_pan(int sns_pan) {
		this.sns_pan = sns_pan;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	
	public boolean matchPassword(String pw) {
		return this.pw != null && this.pw.equals(pw);
	}
	
}
