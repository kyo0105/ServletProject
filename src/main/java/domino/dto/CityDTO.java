package domino.dto;

public class CityDTO {
	// fields
	private int loc_code;
	private String city;
	private String district;
	
	// getter, setter
	public int getLoc_code() {
		return loc_code;
	}
	public void setLoc_code(int loc_code) {
		this.loc_code = loc_code;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	
}
