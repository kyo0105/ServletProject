package domino.dto;

public class PizzaDetailDTO {
	private String pizza_name; // 피자이름
	private String pizza_image; // 피자이미지 
	private String large; // 라지가격
	private String mideum; // 미디움가격
	private String pizza_type; // 피자타입
	private String pizza_tag; // 태그


	public String getPizza_name() {
		return pizza_name;
	}
	public void setPizza_name(String pizza_name) {
		this.pizza_name = pizza_name;
	}
	public String getPizza_image() {
		return pizza_image;
	}
	public void setPizza_image(String pizza_image) {
		this.pizza_image = pizza_image;
	}
	public String getLarge() {
		return large;
	}
	public void setLarge(String large) {
		this.large = large;
	}
	public String getMideum() {
		return mideum;
	}
	public void setMideum(String mideum) {
		this.mideum = mideum;
	}
	public String getPizza_type() {
		return pizza_type;
	}
	public void setPizza_type(String pizza_type) {
		this.pizza_type = pizza_type;
	}
	public String getPizza_tag() {
		return pizza_tag;
	}
	public void setPizza_tag(String pizza_tag) {
		this.pizza_tag = pizza_tag;
	}



}
