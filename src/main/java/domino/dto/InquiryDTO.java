package domino.dto;

import java.sql.Date;

public class InquiryDTO {
	private int iq_code;
	private String category;
	private String shop_loc;
	private String shop_name;
	private String iq_title;
	private Date iq_date;
	private String iq_content;
	private String emp_id;
	private String member_id;
	
	public int getIq_code() {
		return iq_code;
	}
	public void setIq_code(int iq_code) {
		this.iq_code = iq_code;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getShop_loc() {
		return shop_loc;
	}
	public void setShop_loc(String shop_loc) {
		this.shop_loc = shop_loc;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getIq_title() {
		return iq_title;
	}
	public void setIq_title(String iq_title) {
		this.iq_title = iq_title;
	}
	public Date getIq_date() {
		return iq_date;
	}
	public void setIq_date(Date iq_date) {
		this.iq_date = iq_date;
	}
	public String getIq_content() {
		return iq_content;
	}
	public void setIq_content(String iq_content) {
		this.iq_content = iq_content;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
